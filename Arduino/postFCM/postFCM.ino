#define TCP_MSS whatever
#define LWIP_IPV6 whatever
#define LWIP_FEATURES whatever
#define LWIP_OPEN_SRC whatever
#include <ESP8266WiFi.h>
#include <WiFiClientSecure.h>

#ifndef STASSID
//#define STASSID "XXXXXX"
//#define STAPSK  "XXXXXX"
#endif

const char* ssid = "iptime";
const char* password = "byoung9852";
const char* host = "fcm.googleapis.com";
const int httpsPort = 80;
// Use web browser to view and copy // SHA1 fingerprint of the certificate
const char fingerprint[] PROGMEM = "0fd9151c4d4a317b647e87713bd7226b8b4fcbda";
WiFiClient client;

void setup() 
{
  Serial.begin(115200);
  Serial.println();
  Serial.print("connecting to ");
  Serial.println(ssid);
  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
  delay(500);
  Serial.print(".");
}

Serial.println("WiFi connected");
Serial.println("IP address: ");
Serial.println(WiFi.localIP());

//Use WiFiClientSecure class to create TLS connection
WiFiClientSecure client;
Serial.print("connecting to ");
Serial.println(host);
Serial.printf("Using fingerprint '%s'\n", fingerprint);
client.setFingerprint(fingerprint);
if (!client.connect(host, httpsPort)) {
Serial.println("connection failed");
return;
}
sendDataToFirebase();
}

void loop() {
}

void sendDataToFirebase() {
String data = "{" ;
data = data + "\"to\": \"dnCgu0-YQVyup17t3OVtHY:APA91bESLinKtYWcyZX79IOuyh1F0wWNfMbEeolgc0--1PK161Bs5GK1zN6gb-lzNdP6pCZ-QBOEtByslQQBuw_xl7HeVdrzm3cSsd5BBEZf5q6qQq3akX8Zyl3ZoAA6ok4Rs3Hfr_yD\",";
data = data + "\"notification\": {";
data = data + "\"body\": \"접근하였습니다.\",";
data = data + "\"title\" : \"[알림]PETSAFE\" ";
data = data + "} }";
client.println("POST /fcm/send HTTP/1.1");
client.println("Authorization: key=AAAAE5JDLSo:APA91bH2GIHHbSCj2GGjd8GrdMlWfDWUDUD1M0Dma7ayFRm9Uvem6KvyjEgNufwTLWgSW6xiinSjXOr6Qc9qQzuGmvrNEToONU1SAclZW6sZXPQ7Fqx5ZzhDphDIVj0vO2mV6tKsgMam,");
client.println("Content-Type: application/json");
client.println("Host: fcm.googleapis.com");
client.print("Content-Length: ");
client.println(data.length());
client.print("\n");
client.print(data);
Serial.println("Data sent...Reading response..");
//while (client.available()) {
//char c = client.read();
//Serial.print(c);
    String line = client.readStringUntil('\n');
    Serial.println(line);
//}
Serial.println("Finished!");
client.flush();
client.stop();
}
