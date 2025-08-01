package com.example.basic_rev;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;
/* loaded from: classes3.dex */
public class MainActivity extends Activity {
    Button b1;
    EditText ed1;

    public String makeFlag(String s) {
        String a = "" + s.charAt(5);
        String _b = s.charAt(2) + "";
        for (int s_ = 0; s_ < s.length(); s_++) {
            String b = _b.substring(_b.length() - s_) + _b.substring(s_);
            String _b2 = s_ >= 3 ? _b + s.charAt(s_ - 3) + "" : _b + s.charAt(s.length() - (3 - s_)) + "";
            if (s_ >= _b2.length()) {
                _b = _b2 + s.charAt(s_ - _b2.length()) + "";
            } else if (s.length() >= _b2.length() - s_) {
                _b = _b2 + s.charAt(s.length() - (_b2.length() - s_)) + "";
            } else {
                _b = _b2 + s.charAt(s.length() - ((_b2.length() - s_) - s.length())) + "";
            }
            a = a + b.charAt((((s.length() + _b.length()) * s_) + _b.length()) % b.length());
        }
        return a.substring(0, 2) + s.charAt(3) + a.charAt(3) + '0' + a.substring(5, 7);
    }

    @Override // android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        this.b1 = (Button) findViewById(R.id.button);
        this.ed1 = (EditText) findViewById(R.id.editText);
        final String seed = getString(R.string.seed);
        this.b1.setOnClickListener(new View.OnClickListener() { // from class: com.example.basic_rev.MainActivity.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                if (MainActivity.this.ed1.getText().toString().equals(MainActivity.this.makeFlag(seed))) {
                    Toast.makeText(MainActivity.this.getApplicationContext(), "Well played! You can validate now with this password :)", 0).show();
                } else {
                    Toast.makeText(MainActivity.this.getApplicationContext(), "Try again ;)", 0).show();
                }
            }
        });
    }
}
