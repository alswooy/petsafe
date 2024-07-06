#define TCP_MSS whatever
#define LWIP_IPV6 whatever
#define LWIP_FEATURES whatever
#define LWIP_OPEN_SRC whatever
#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>
#include <FCM.h>

#define SSID "iptime"
#define PASS "byoung9852"

#define TOKEN  "dnCgu0-YQVyup17t3OVtHY:APA91bESLinKtYWcyZX79IOuyh1F0wWNfMbEeolgc0--1PK161Bs5GK1zN6gb-lzNdP6pCZ-QBOEtByslQQBuw_xl7HeVdrzm3cSsd5BBEZf5q6qQq3akX8Zyl3ZoAA6ok4Rs3Hfr_yD"
#define SERVER "AAAAE5JDLSo:APA91bH2GIHHbSCj2GGjd8GrdMlWfDWUDUD1M0Dma7ayFRm9Uvem6KvyjEgNufwTLWgSW6xiinSjXOr6Qc9qQzuGmvrNEToONU1SAclZW6sZXPQ7Fqx5ZzhDphDIVj0vO2mV6tKsgMam"
int pin=A0;
int _builtInLed = 16;
FCM FCM;


void setup() {
  // CONECTA A LA RED 
   
    Serial.begin(115200);
    WiFi.begin(SSID, PASS);
    pinMode(_builtInLed, OUTPUT);
    Serial.begin(115200);
      while (WiFi.status() != WL_CONNECTED)
      {
        Serial.print(".\n");
        delay(100);
      }
      Serial.print("CONECTADO... ");
      Serial.println(WiFi.localIP());
      
}

void loop() {
  int value=analogRead(pin);
  //Al precionar el Boton conectado al pin 0 Envia el Mensaje
  if(value>=570)
    {
        digitalWrite(_builtInLed, LOW);
        delay(1000);
        Serial.println("message start");
        FCM.enviarMensaje(TOKEN, "[알림]PETSAFE", "접근하였습니다.", SERVER);
      
    }else{
      digitalWrite(_builtInLed, HIGH);
      delay(1000);
    }

}
