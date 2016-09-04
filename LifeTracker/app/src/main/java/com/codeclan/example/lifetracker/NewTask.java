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
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.lang.reflect.Type;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

/**
 * Created by user on 21/08/2016.
 */
public class NewTask extends AppCompatActivity {

    TextView mPageHeader;
    ListView mListView;
    ImageButton mAddButton;
    EditText mTaskTitle;
    EditText mTaskText;
    String mTaskType;
    ArrayList<Task> mTaskArray;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_new_task);
        String json_saved = SavedTaskPreferences.getStoredTasks(this);
        if (getSupportActionBar() != null) {
            getSupportActionBar().setDisplayHomeAsUpEnabled(false);
        }
        Intent intent = getIntent();
        Bundle extras = intent.getExtras();
        mTaskType = extras.getString("type");
        if(json_saved == null) {
            mTaskArray = new ArrayList<>();
        }
        else {
            Log.d("Array String : ", json_saved);
            mTaskArray = SavedTaskPreferences.convertToObjectArray(this, json_saved);
        }
        mPageHeader = (TextView) findViewById(R.id.new_task_header);
        mAddButton = (ImageButton)findViewById(R.id.add_task_button);
        mTaskTitle = (EditText)findViewById(R.id.task_title);
        mTaskText = (EditText)findViewById(R.id.task_text);
        mListView = (ListView)findViewById(R.id.task_list_view);
        Typeface pencil_font = Typeface.createFromAsset(getAssets(), "fonts/pencil.ttf");
        mTaskTitle.setTypeface(pencil_font);
        mTaskText.setTypeface(pencil_font);
        mPageHeader.setTypeface(pencil_font);

        mAddButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Context context = view.getContext();
                String json_saved = SavedTaskPreferences.getStoredTasks(context);
                if(json_saved == null){
                    mTaskArray = new ArrayList<>();
                }
                else {
                    Gson gson = new Gson();
                    Type objectType = new TypeToken<ArrayList<Task>>() {
                    }.getType();
                    mTaskArray = gson.fromJson(json_saved, objectType);
                    Log.d("Saved Tasks : ", mTaskArray + " array contents");
                }
                view.startAnimation(AnimationUtils.loadAnimation(view.getContext(), R.anim.bounce));
                String newTitle = mTaskTitle.getText().toString();
                String newText = mTaskText.getText().toString();
                String newType = mTaskType;
                String newDate = getCurrentDate();
                Intent newIntent = new Intent(NewTask.this, LifeTracker.class);
                Task task = new Task(newTitle, newType, newText, newDate);
                mTaskArray.add(task);
                String json = new Gson().toJson(mTaskArray);
                Log.d("New Task Array : ", json + " array contents");
                SavedTaskPreferences.setStoredTasks(context, json);
                newIntent.putExtra("array_string", json);
                startActivity(newIntent);
            }
            public String getCurrentDate(){
                Calendar c = Calendar.getInstance();
                SimpleDateFormat df = new SimpleDateFormat("dd-MMM-yyyy");
                return df.format(c.getTime());
            }
        });
    }

    @Override
    public void onBackPressed() {
        Intent intent = new Intent(NewTask.this, TaskList.class);
        Log.d("Stuff:", "" + mTaskType);
        intent.putExtra("type", mTaskType);
        startActivity(intent);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater menuInflater = getMenuInflater();
        menuInflater.inflate(R.menu.activity_new_task, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == R.id.action_home) {
            Toast.makeText(NewTask.this, R.string.home_toast,
                    Toast.LENGTH_SHORT).show();
            Intent intent = new Intent(NewTask.this, LifeTracker.class);
            startActivity(intent);
            return true;
        }
        return super.onOptionsItemSelected(item);
    }

}
