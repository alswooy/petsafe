/*
  FCM.cpp - Libreria que envia mensajes por Firebase Cloud Messangin
  Creado por Gonzalo Dutra, 4 de Octubre, 2018.
  Libreria de uso interno
*/
 
#include "Arduino.h"
#include "FCM.h"
#include "ESP8266WiFi.h"


WiFiClient client;
 
FCM::FCM()
{
	_data = "";
}
 
void FCM::enviarMensaje(String idToken, String titulo, String cuerpo, String idServer)
{
	String _data = "{";
	_data = _data + "\"to\": \"" + idToken + "\",";
	_data = _data + "\"priority\": \"high\",";
	_data = _data + "\"notification\": {";
	_data = _data + "\"body\": \""+ cuerpo +"\",";
	_data = _data + "\"title\" : \""+ titulo +"\"";
	_data = _data + "} }";
	Serial.println("create message");
	
     if (client.connect("fcm.googleapis.com", 80)) {
        Serial.println("firebase create");
	//출력은 나온다 하지만 client 부분이 안되는거 같다.		
        client.println("POST /fcm/send HTTP/1.1");
        client.println("Authorization: key="+ idServer);
        client.println("Content-Type: application/json");
        client.println("Host: fcm.googleapis.com");
        client.print("Content-Length: ");
        client.println(_data.length());
        client.print("\n");
        client.print(_data);
		
    }
    client.print("test");
    Serial.println("message send !");
    while (client.available()) { //이부분에서 client 가 없어서출력이안되는거보니윗문장이문제?
        char c = client.read();
        Serial.print(c);
    }
    Serial.println("Finished !");
    client.flush();
    client.stop();
}
 
