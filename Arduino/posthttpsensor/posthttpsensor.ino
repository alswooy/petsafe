
#define TCP_MSS whatever
#define LWIP_IPV6 whatever
#define LWIP_FEATURES whatever
#define LWIP_OPEN_SRC whatever
#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>
#include <FirebaseJson.h>

#define STASSID "iptime"
#define STAPSK  "byoung9852"

int _fsrPin = A0;
int _builtInLed = 16;
const int buzzer =  6;

void setup() {
  Serial.begin(115200);
  pinMode(_builtInLed, OUTPUT);
  Serial.begin(115200);

  Serial.println();
  Serial.println();
  Serial.println();

  WiFi.begin(STASSID, STAPSK);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.print("Connected! IP address: ");
  Serial.println(WiFi.localIP());

}

void loop() {
  // wait for WiFi connection
  int Value = analogRead(_fsrPin);
  Serial.print("Force = ");
  Serial.println(Value);
   if (Value < 580){
    digitalWrite(_builtInLed, HIGH);
  }else{
    digitalWrite(_builtInLed, LOW);
  }
  delay(1000);
  
  WiFiClient client;
  String v;
    if (Value <=540 ) {
      v = "아무것도없습니다.";
    } else {
      v = "접근하였습니다.";
    }
    FirebaseJson json;
  String data = "{";
  data = data + "\"to\": \"dnCgu0-YQVyup17t3OVtHY:APA91bESLinKtYWcyZX79IOuyh1F0wWNfMbEeolgc0--1PK161Bs5GK1zN6gb-lzNdP6pCZ-QBOEtByslQQBuw_xl7HeVdrzm3cSsd5BBEZf5q6qQq3akX8Zyl3ZoAA6ok4Rs3Hfr_yD\",";
  data = data + "\"notification\": {";
  data = data + "\"body\": \""+v+"\",";
  data = data + "\"title\" : \"[알림]petsafe\",";
  data = data + "\"sound\" : \"default\",";
  data = data + "\"vibrate\" : \"true\"";
  data = data + "} }";
 
  //Serial.println(data); //debug
  Serial.println("Send data ...");
  // Connect to Firebase server
  if (client.connect("http://petsafe-d5028-default-rtdb.firebaseio.com", 80)) {
    Serial.println("Connected to the server..");
    client.println("POST http://fcm.googleapls.com/fcm/send HTTP/1.1");
    client.println("Host: fcm.googleapis.com");
    client.println("Authorization: key=AAAAE5JDLSo:APA91bH2GIHHbSCj2GGjd8GrdMlWfDWUDUD1M0Dma7ayFRm9Uvem6KvyjEgNufwTLWgSW6xiinSjXOr6Qc9qQzuGmvrNEToONU1SAclZW6sZXPQ7Fqx5ZzhDphDIVj0vO2mV6tKsgMam");
    client.println("Content-Type: application/json");
    client.print("Content-Length: ");
    client.println(data.length());
    client.println();
    client.println(data);
    json.toString(client, true);

    Serial.println("Data sent...");   
  } else {
    //서버연결 실패시 3회정도 재시도 하게 할려면 어떻게 해야 하지?
    Serial.println("FCM connection failed!");
    client.stop();
  }

  Serial.println("Reading response...");
  while(client.available()){
    char c = client.read();
    Serial.print(c);
  }
  Serial.println("Finished");
  client.flush();  //wait until all outgoing characters in buffer have been sent.
  client.stop(); // Disconnect from the server.
  delay(10000);
}

