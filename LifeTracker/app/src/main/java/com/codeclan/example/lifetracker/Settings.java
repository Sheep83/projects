package com.codeclan.example.lifetracker;

import android.content.Context;
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
 * Created by user on 24/08/2016.
 */
public class Settings extends AppCompatActivity {

    TextView mSettingsHeader;
    ImageButton mDeleteButton;
    TextView mSettingsText;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_settings);
        mSettingsHeader = (TextView) findViewById(R.id.title_text);
        mDeleteButton = (ImageButton)findViewById(R.id.delete_task_button);
        mSettingsText = (TextView) findViewById(R.id.settings_text);
        Typeface pencil_font = Typeface.createFromAsset(getAssets(), "fonts/pencil.ttf");
        mSettingsHeader.setTypeface(pencil_font);
        mSettingsText.setTypeface(pencil_font);

        mDeleteButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Context context = view.getContext();
                view.startAnimation(AnimationUtils.loadAnimation(view.getContext(), R.anim.bounce));
                Intent newIntent = new Intent(Settings.this, LifeTracker.class);
                SavedTaskPreferences.clearPrefs(context);
                Log.d("Wiping stored stuff... : ", " wiped");
                startActivity(newIntent);
            }
        });
    }
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater menuInflater = getMenuInflater();
        menuInflater.inflate(R.menu.activity_settings, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
     if (item.getItemId() == R.id.action_home) {
            Toast.makeText(Settings.this, R.string.home_toast,
                    Toast.LENGTH_SHORT).show();
            Intent intent = new Intent(Settings.this, LifeTracker.class);
            startActivity(intent);
            return true;
        }
        return super.onOptionsItemSelected(item);
    }

}
