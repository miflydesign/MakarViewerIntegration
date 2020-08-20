package com.example.nativeandroidapp;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import org.mifly.makar.unity.MakarViewerManager;

public class MainActivity extends AppCompatActivity
{

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);


        Button showProjectBtn = findViewById(R.id.showProjectBtn);
        showProjectBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v)
            {

                MakarViewerManager makarViewerManager = MakarViewerManager.getInstance();
                makarViewerManager.InitializedWithKey("MAKAR_API_KEY");
                makarViewerManager.ShowProjectWithProjectId("2e011aec1f0be6547f9069bfe05816ee", MakarViewerManager.ProjectType.ar, getApplicationContext());
            }
        });


        Button showUserIdBtn = findViewById(R.id.showUserIdBtn);
        showUserIdBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v)
            {

                MakarViewerManager makarViewerManager = MakarViewerManager.getInstance();
                makarViewerManager.InitializedWithKey("MAKAR_API_KEY");
                makarViewerManager.ShowUserWith( "makarvr", getApplicationContext());

            }
        });
    }

}
