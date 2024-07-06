#define TCP_MSS whatever
#define LWIP_IPV6 whatever
#define LWIP_FEATURES whatever
#define LWIP_OPEN_SRC whatever
#include <ESP8266WiFi.h>

const char* ssid = "iptime";
const char* password = "byoung9852";

int LED = 2; 

WiFiServer server(80);

void setup() {
  // put your setup code here, to run once:
  delay(10);
  Serial.begin(115200);

  Serial.println();
  Serial.println();
  Serial.println("connecting to my ssid.");
  
  WiFi.begin(ssid, password);
  
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.println(".");
  }
  Serial.println("");
  Serial.println("WiFi connected");

  // start the server
  server.begin();
  Serial.println("Server started");
  Serial.println("Use this URL to connect");
  Serial.print("http://");
  Serial.print(WiFi.localIP());
  Serial.println("/");

  //
  
}

void loop() {
  // put your main code here, to run repeatedly:
  WiFiClient client = server.available();
  if(!client){
    return;
  } else {
    Serial.println("New client connect...");
    boolean blank_line = true;
    while(client.connected()){
      char c = client.read();
      if (c == '\n' && blank_line) {
         String v;
    if (Value == 0) {
      v = "아무것도없습니다.";
    } else {
      v = "접근하였습니다.";
    }
    
  String data = "{";
  data = data + "\"to\": \"/topics/nodemcu\",";
  data = data + "\"notification\": {";
  data = data + "\"body\": \""+v+"\",";
  data = data + "\"title\" : \"[알림]petsafe\",";
  data = data + "\"sound\" : \"default\",";
  data = data + "\"vibrate\" : \"true\"";
  data = data + "} }";
 
  //Serial.println(data); //debug
  Serial.println("Send data ...");
  // Connect to Firebase server
  if (client.connect(petsafe-d5028, 80)) {
    Serial.println("Connected to the server..");
    client.println("POST /fcm/send HTTP/1.1");
    client.println("Host: fcm.googleapis.com");
    client.println("Authorization: key=AAAAE5JDLSo:APA91bH2GIHHbSCj2GGjd8GrdMlWfDWUDUD1M0Dma7ayFRm9Uvem6KvyjEgNufwTLWgSW6xiinSjXOr6Qc9qQzuGmvrNEToONU1SAclZW6sZXPQ7Fqx5ZzhDphDIVj0vO2mV6tKsgMam");
    client.println("Content-Type: application/json");
    client.print("Content-Length: ");
    client.println(data.length());
    client.println();
    client.println(data);

    Serial.println("Data sent...");   
  } else {
    //서버연결 실패시 3회정도 재시도 하게 할려면 어떻게 해야 하지?
    Serial.println("FCM connection failed!");
    client.stop();
  }
}
