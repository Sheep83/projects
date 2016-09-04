package com.codeclan.example.lifetracker;


import android.content.Intent;
import android.graphics.Typeface;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.animation.AnimationUtils;
import android.widget.ImageButton;
import android.widget.TextView;
import android.widget.Toast;

/**
 * Created by user on 21/08/2016.
 */
public class LifeTracker extends AppCompatActivity {
    TextView mTitleText, mBoringText, mWorkText, mSocialText, mRecText, mLifeText;
    ImageButton mBoringButton;
    ImageButton mSocialButton;
    ImageButton mWorkButton;
    ImageButton mRecButton;
    ImageButton mLifeButton;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        mTitleText = (TextView) findViewById(R.id.title_text);
        mBoringButton = (ImageButton)findViewById(R.id.boring_button);
        mWorkButton = (ImageButton)findViewById(R.id.work_button);
        mSocialButton = (ImageButton)findViewById(R.id.social_button);
        mRecButton = (ImageButton)findViewById(R.id.recreation_button);
        mLifeButton = (ImageButton)findViewById(R.id.life_button);
        mBoringText = (TextView) findViewById(R.id.boring_text);
        mWorkText = (TextView) findViewById(R.id.work_text);
        mSocialText = (TextView) findViewById(R.id.social_text);
        mRecText = (TextView) findViewById(R.id.recreation_text);
        mLifeText = (TextView) findViewById(R.id.life_text);
        Typeface pencil_font = Typeface.createFromAsset(getAssets(), "fonts/pencil.ttf");
        mTitleText.setTypeface(pencil_font);
        mBoringText.setTypeface(pencil_font);
        mWorkText.setTypeface(pencil_font);
        mSocialText.setTypeface(pencil_font);
        mRecText.setTypeface(pencil_font);
        mLifeText.setTypeface(pencil_font);

        mBoringButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                view.startAnimation(AnimationUtils.loadAnimation(view.getContext(), R.anim.bounce));
                Intent intent = new Intent(LifeTracker.this, TaskList.class);
                intent.putExtra("type", "Boring");
                Log.d("LifeTracker:", "Boring Button Clicked!");
                startActivity(intent);
            }
        });

        mWorkButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                view.startAnimation(AnimationUtils.loadAnimation(view.getContext(), R.anim.bounce));
                Intent intent = new Intent(LifeTracker.this, TaskList.class);
                intent.putExtra("type", "Work");
                Log.d("LifeTracker: ", "Work Button Clicked!");
                startActivity(intent);
            }
        });

        mSocialButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                view.startAnimation(AnimationUtils.loadAnimation(view.getContext(), R.anim.bounce));
                Intent intent = new Intent(LifeTracker.this, TaskList.class);
                intent.putExtra("type", "Social");
                Log.d("LifeTracker: ", "Social Button Clicked!");
                startActivity(intent);
            }
        });

        mRecButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                view.startAnimation(AnimationUtils.loadAnimation(view.getContext(), R.anim.bounce));
                Intent intent = new Intent(LifeTracker.this, TaskList.class);
                intent.putExtra("type", "Recreation");
                Log.d("LifeTracker: ", "Recreation Button Clicked!");
                startActivity(intent);
            }
        });

        mLifeButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                view.startAnimation(AnimationUtils.loadAnimation(view.getContext(), R.anim.bounce));
                Intent intent = new Intent(LifeTracker.this, TaskList.class);
                intent.putExtra("type", "Life");
                Log.d("LifeTracker: ", "Life Button Clicked!");
                startActivity(intent);
            }
        });

    }
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater menuInflater = getMenuInflater();
        menuInflater.inflate(R.menu.activity_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == R.id.action_settings) {
            Toast.makeText(LifeTracker.this, R.string.settings_toast,
                    Toast.LENGTH_SHORT).show();
            Intent intent = new Intent(LifeTracker.this, Settings.class);
            startActivity(intent);
            return true;
        }
        return super.onOptionsItemSelected(item);
    }


}

