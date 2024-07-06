#define LED D4
#define SENSOR D7
#define TCP_MSS whatever
#define LWIP_IPV6 whatever
#define LWIP_FEATURES whatever
#define LWIP_OPEN_SRC whatever
#include <ESP8266WiFi.h>
void sendDataToFirebase(){
  WiFiClient client;
  
  String v;
    if (SENSOR == 0) {
      v = "아무일도 없습니다.";
    } else {
      v = "현관문이 열렸습니다.";
    }
    
  String data = "{";
  data = data + "\"to\": \"/topics/nodemcu\",";
  data = data + "\"notification\": {";
  data = data + "\"body\": \""+v+"\",";
  data = data + "\"title\" : \"[알림]도어센서 상태\",";
  data = data + "\"sound\" : \"default\",";
  data = data + "\"vibrate\" : \"true\"";
  data = data + "} }";
 
  //Serial.println(data); //debug
  Serial.println("Send data ...");
  // Connect to Firebase server
  if (client.connect("https://petsafe-d5028-default-rtdb.firebaseio.com", 80)) {
    Serial.println("Connected to the server..");
    client.println("POST /fcm/send HTTP/1.1");
    client.println("Host: fcm.googleapis.com");
    client.println("Authorization: key=your_fcm_server_key");
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

  Serial.println("Reading response...");
  while(client.available()){
    char c = client.read();
    Serial.print(c);
  }
  Serial.println("Finished");
  client.flush();  //wait until all outgoing characters in buffer have been sent.
  client.stop(); // Disconnect from the server.
}
