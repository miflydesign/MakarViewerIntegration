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

        Button showARProjectBtn = findViewById(R.id.showARProjectBtn);
        showARProjectBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v)
            {

                MakarViewerManager makarViewerManager = MakarViewerManager.getInstance();
                makarViewerManager.InitializedWithKey("00000000-0000-0000-0000-000000000000");
                makarViewerManager.ShowProjectWithProjectId("2e011aec1f0be6547f9069bfe05816ee", MakarViewerManager.ProjectType.ar, getApplicationContext());
            }
        });

        Button showARSlamProjectBtn = findViewById(R.id.showARSlamProjectBtn);
        showARSlamProjectBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v)
            {

                MakarViewerManager makarViewerManager = MakarViewerManager.getInstance();
                makarViewerManager.InitializedWithKey("00000000-0000-0000-0000-000000000000");
                makarViewerManager.ShowProjectWithProjectId("710a2900eab92b1a88a71171c3e6bb69", MakarViewerManager.ProjectType.ar_slam, getApplicationContext());
            }
        });

        Button showVRProjectBtn = findViewById(R.id.showVRProjectBtn);
        showVRProjectBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v)
            {

                MakarViewerManager makarViewerManager = MakarViewerManager.getInstance();
                makarViewerManager.InitializedWithKey("00000000-0000-0000-0000-000000000000");
                makarViewerManager.ShowProjectWithProjectId("ce4cd94181b8ea2f6052c0e0739878f1", MakarViewerManager.ProjectType.vr, getApplicationContext());
            }
        });

        Button showUserIdBtn = findViewById(R.id.showUserIdBtn);
        showUserIdBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v)
            {

                MakarViewerManager makarViewerManager = MakarViewerManager.getInstance();
                makarViewerManager.InitializedWithKey("00000000-0000-0000-0000-000000000000");
                makarViewerManager.ShowUserWith( "Makarvr", getApplicationContext());

            }
        });
    }

}
