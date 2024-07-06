#define TCP_MSS whatever
#define LWIP_IPV6 whatever
#define LWIP_FEATURES whatever
#define LWIP_OPEN_SRC whatever
#define SENSOR D7
#include <ESP8266WiFi.h>



const char* ssid = "iptime";

const char* password = "byoung9852";



// Create an instance of the server

// specify the port to listen on as an argument

WiFiServer server(80);

//HTTP 통신은 80번 포트를 사용합니다.



void setup() {

  Serial.begin(115200);
  delay(10);
  // prepare GPIO2
  pinMode(2, OUTPUT);
  digitalWrite(2, 0);
  // Connect to WiFi network
  Serial.println();
  Serial.println();
  Serial.print("Connecting to ");
  Serial.println(ssid);
  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  Serial.println("");
  Serial.println("WiFi connected");


  server.begin();

  Serial.println("Server started");

  // Print the IP address

  Serial.println(WiFi.localIP());
}



void loop() {
  // Check if a client has connected
  // 클라이언트(사용자)가 접속을 했을때
  WiFiClient client = server.available();

  if (!client) {
    return;
  }
  Serial.println("new client");
  while(!client.available()){
   delay(1);
  }
  

  // Read the first line of the request
  // 사용자가 전송한 리퀘스트 헤더를 읽습니다.
  String req = client.readStringUntil('\r');
  Serial.println(req);
  //GET /gpio/1 HTTP/1.1 과 같은 값이 출력 됩니다.
  client.flush();
  // Match the request
  // 리퀘스트 헤더에 저희가 필요로 하는 요청이 들어있는지 확인합니다.
  int val;
  if (req.indexOf("/gpio/0") != -1)
    val = 0;
  else if (req.indexOf("/gpio/1") != -1)
    val = 1;
  else {
    Serial.println("invalid request");
    client.stop();
    return;

  }
  // Set GPIO2 according to the request
  digitalWrite(2, val);// 요청한 내용대로 해당 디지털 핀을 제어합니다.
  client.flush();
  String v;
    if (SENSOR == 0) {
      v = "아무것도 없습니다";
    } else {
      v = "접근하였습니다.";
    }
  // Prepare the response
  String data = "{";
  data = data + "\"to\": \"/topics/nodemcu\",";
  data = data + "\"notification\": {";
  data = data + "\"body\": \""+v+"\",";
  data = data + "\"title\" : \"[알림]위험 감지 알림\",";
  data = data + "\"sound\" : \"default\",";
  data = data + "\"vibrate\" : \"true\"";
  data = data + "} }";
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

