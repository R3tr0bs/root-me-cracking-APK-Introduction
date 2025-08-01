# root-me-cracking-APK-Introduction

---

### Setup & Tools

- **APKLab**: For slicing and dicing APK files like a master chef.
- **My Android Phone**: Because emulators are for cowards (and I like to live dangerously).
- **MobaXterm**: SSH like a boss.
- **Music Playlist**: Because working without music is a crime. [YouTube Music](https://music.youtube.com/playlist?list=PLsaTaTh7fDWEq_JMpTKHqwNzmM3tDFQFy&si=RsgwNSH1G1gUVFfa)
- **Energy Drinks**: XL/Blue/RedBull/Monster or anything that makes your heart race and your hands shake.

---

# Let the Cracking Begin 🚀

## Step 1: Reconnaissance

Like any good hacker (or chef), the first step is to taste the dish. So, I opened the app on my phone. It asked for a password. If you get it wrong, it says:  
**"Try Again ;)"**  
Classic. Now we know what we’re hunting for!

## Step 2: Dissection with APKLab

Time to pop open APKLab and see what’s inside (make sure you check the decompyle java because java byte code is disgusting). Let's take a look at the decompiled Java code, specifically the [MainActivity.java](./basic_rev/java_src/com/example/basic_rev/MainActivity.java):

```java
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
```

## Step 3: The Hunt for the Seed

But wait! What’s this?
```java
final String seed = getString(R.string.seed);
```
Where is this mysterious `seed`?  
A quick search in the XML files (pro tip: always check your resources!) and we find it in [strings.xml](./basic_rev/res/values/strings.xml):

```xml
<string name="seed">1dndr@</string>
```

## Step 4: Reverse Engineering the Flag

Now, what does this `makeFlag` function actually do?  
I could spend hours tracing it, or I could just dump it into ChatGPT and ask for a Python version (guess which one I did):

```python
def make_flag(s):
    a = s[5]
    _b = s[2]

    for s_ in range(len(s)):
        # b = _b.substring(_b.length() - s_) + _b.substring(s_);
        b = _b[len(_b) - s_:] + _b[s_:]

        # _b2 = s_ >= 3 ? _b + s.charAt(s_ - 3) : _b + s.charAt(s.length() - (3 - s_));
        if s_ >= 3:
            _b2 = _b + s[s_ - 3]
        else:
            _b2 = _b + s[len(s) - (3 - s_)]

        # Java's substring index logic becomes more complex in Python
        if s_ >= len(_b2):
            _b = _b2 + s[s_ - len(_b2)]
        elif len(s) >= len(_b2) - s_:
            _b = _b2 + s[len(s) - (len(_b2) - s_)]
        else:
            _b = _b2 + s[len(s) - ((len(_b2) - s_) - len(s))]

        idx = (((len(s) + len(_b)) * s_) + len(_b)) % len(b)
        a += b[idx]

    return a[:2] + s[3] + a[3] + '0' + a[5:7]

# Example usage (replace with actual seed from strings.xml):
seed = "1dndr@"
flag = make_flag(seed)
print("Flag:", flag)
```

And voilà, the flag is:
```
@ndr01d
```

## Step 5: Victory Lap

Tested it in the app and got:  
**"Well played! You can validate now with this password :)"**

Mission accomplished.  
Time for another energy drink. Or maybe a nap.  
Either way, happy cracking! 😎
