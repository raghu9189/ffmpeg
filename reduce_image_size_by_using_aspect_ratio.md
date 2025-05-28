To **lower the pixel dimensions (resize)** an image using `ffmpeg`, you can use the `-vf scale=WIDTH:HEIGHT` option.

---

### ✅ Example: Resize and Convert to WebP with Lower Resolution

```bash
ffmpeg -i input.jpg -vf scale=800:600 -q:v 5 output.webp
```

* `-vf scale=800:600` resizes the image to 800×600 pixels.
* `-q:v 5` controls the quality (lower is better quality).
* Output format is inferred from `.webp`.

---

### 🧠 Tip: Keep Aspect Ratio Automatically

If you want to **resize based on width** and keep the aspect ratio:

```bash
ffmpeg -i input.jpg -vf scale=800:-1 -q:v 5 output.webp
```

* `scale=800:-1` means:

  * Width: 800px
  * Height: calculated automatically to maintain aspect ratio

---

### 💡 Update Your Script to Include Resizing

To apply resizing to your whole script, modify the `ffmpeg` line like this:

```bash
ffmpeg -i "$img" -vf scale=800:-1 -q:v $QUALITY "$output_path"
```

Let me know the target resolution or pixel size you want, and I’ll update the full script for you.
