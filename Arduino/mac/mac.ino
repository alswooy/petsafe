#define TCP_MSS whatever
#define LWIP_IPV6 whatever
#define LWIP_FEATURES whatever
#define LWIP_OPEN_SRC whatever
#include <ESP8266WiFi.h>

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  Serial.println();
  Serial.println("이 장치의 맥어드레스？");
  
  Serial.println(WiFi.macAddress());

}

void loop() {
  // put your main code here, to run repeatedly:

}
