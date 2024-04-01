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
                makarViewerManager.ShowProjectWithProjectId("c2ca3fda-83fb-4a74-83ea-41bbe084e0a9", MakarViewerManager.ProjectType.ar, getApplicationContext());
            }
        });

        Button showARSlamProjectBtn = findViewById(R.id.showARSlamProjectBtn);
        showARSlamProjectBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v)
            {

                MakarViewerManager makarViewerManager = MakarViewerManager.getInstance();
                makarViewerManager.InitializedWithKey("00000000-0000-0000-0000-000000000000");
                makarViewerManager.ShowProjectWithProjectId("830f8ae9117aa2bc30097ba16936bbe9", MakarViewerManager.ProjectType.ar_slam, getApplicationContext());
            }
        });

        Button showVRProjectBtn = findViewById(R.id.showVRProjectBtn);
        showVRProjectBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v)
            {

                MakarViewerManager makarViewerManager = MakarViewerManager.getInstance();
                makarViewerManager.InitializedWithKey("00000000-0000-0000-0000-000000000000");
                makarViewerManager.ShowProjectWithProjectId("f6574a6c-4595-4124-8c9f-a9605a8b5d8c", MakarViewerManager.ProjectType.vr, getApplicationContext());
            }
        });

//        Button showHandProjectBtn = findViewById(R.id.showHandProjectBtn);
//        showHandProjectBtn.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View v)
//            {
//
//                MakarViewerManager makarViewerManager = MakarViewerManager.getInstance();
//                makarViewerManager.InitializedWithKey("00000000-0000-0000-0000-000000000000");
//                makarViewerManager.ShowProjectWithProjectId(PROJECT_ID, MakarViewerManager.ProjectType.hand, getApplicationContext());
//            }
//        });
//
//        Button showMixProjectBtn = findViewById(R.id.showMixProjectBtn);
//        showMixProjectBtn.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View v)
//            {
//
//                MakarViewerManager makarViewerManager = MakarViewerManager.getInstance();
//                makarViewerManager.InitializedWithKey("00000000-0000-0000-0000-000000000000");
//                makarViewerManager.ShowProjectWithProjectId(PROJECT_ID, MakarViewerManager.ProjectType.mix, getApplicationContext());
//            }
//        });
    }

}
