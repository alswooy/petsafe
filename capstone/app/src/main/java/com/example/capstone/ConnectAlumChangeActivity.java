package com.example.capstone;

import android.os.AsyncTask;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

public class ConnectAlumChangeActivity extends AsyncTask<String, Void, String> {
    String sendMsg, receiveMsg;

    public String Eip = "172.16.15.73";

    String server = "http://"+ Eip +":8080/WebAndroid/Android/alum/androidAlumChangeDB.jsp";

    @Override
    protected String doInBackground(String... strings) {

        try{
            String str;
            URL url = new URL(server);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            conn.setRequestMethod("POST");
            OutputStreamWriter osw = new OutputStreamWriter(conn.getOutputStream(), "UTF-8");

            sendMsg = "userId=" + strings[0] + "&cno=" + strings[1] +"&ctitle=" + strings[2] + "&regdate=" + strings[3] + "&cmemo=" + strings[4] + "&rgb=" + strings[5];

            osw.write(sendMsg);
            osw.flush();

            //jsp와 통신 성공 시 수행
            if (conn.getResponseCode() == conn.HTTP_OK) {
                InputStreamReader tmp = new InputStreamReader(conn.getInputStream(), "UTF-8");
                BufferedReader reader = new BufferedReader(tmp);
                StringBuffer buffer = new StringBuffer();

                // jsp에서 보낸 값을 받는 부분
                while ((str = reader.readLine()) != null) {
                    buffer.append(str);
                }
                receiveMsg = buffer.toString();
            } else {
                receiveMsg = "fail";
            }
        } catch (MalformedURLException e) {
            e.printStackTrace();
            receiveMsg = e.getMessage();

        } catch (IOException e) {
            e.printStackTrace();
            receiveMsg = e.getMessage();
        }

        //jsp로부터 받은 리턴 값
        return receiveMsg;


    }
}
