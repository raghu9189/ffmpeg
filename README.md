# Video Processing

## Easy Convert

```bash
ffmpeg -i demo.mp4 output.mkv
```

## Lower MP4 Video Quality (CRF: Constant Rate Factor)

```bash
ffmpeg -i demo.mp4 -crf 28 -preset ultrafast low_quality.mp4
ffmpeg -i demo.mp4 -crf 50 -preset ultrafast low_quality1.mp4
ffmpeg -i demo.mp4 -crf 30 -preset fast low_quality2.mp4
```

## Reduce Resolution (4K to 1080p or 720p)

```bash
ffmpeg -i input.mp4 -vf scale=1280:720 -c:v libx264 -crf 23 output.mp4
```

## Reduce File Size by Lowering Bitrate (CBR: Constant Bitrate)

```bash
ffmpeg -i input.mp4 -b:v 1M output.mp4
ffmpeg -i input/355993_av1.mp4 -vf scale=1280:720 -c:v libx264 -b:v 500k output/bit3.mp4
```

## Convert MP4 to MP3 (Discard Video)

```bash
ffmpeg -i demo.mp4 -vn output_audio.mp3
ffmpeg -i demo.mp4 -vn -q:a 0 output_audio1.mp3
```

## Ignore Audio from Video

```bash
ffmpeg -i input.mp4 -an output.mp4
```

## Increase Video Contrast

```bash
ffmpeg -i demo.mp4 -vf "eq=contrast=1.3" constrasted.mp4
ffmpeg -i full.jpg -vf eq=contrast=1.4 output.jpg
```

## Convert Video Clip to GIF

```bash
ffmpeg -i input.mp4 -vf scale=320:240,fps=10 output.gif
```

## Cut Video Portion (HH\:MM\:SS)

```bash
ffmpeg -i input.mp4 -ss 00:02:00 -to 00:05:00 -c copy output.mp4
```

## Take a Screenshot from Video

```bash
ffmpeg -ss 00:01:30 -i input.mp4 -vframes 1 output.jpg
```

## Crop Video

```bash
ffmpeg -i input.mp4 -vf crop=w=1172:h=827:x=368:y=126 output.mp4
```

---

# Image Processing

## Convert JPG to SVG

```bash
ffmpeg -i input.jpg -pix_fmt svg output.svg
```

## Compress Image by Reducing Resolution

```bash
ffmpeg -i input_image.jpg -vf "scale=iw*0.75:ih*0.75" output_image.jpg
```

## Compress Image without Reducing Resolution

```bash
ffmpeg -i input_image.jpg -q:v 5 output_image.jpg
```

## Compress Image by Reducing Aspect Ratio

```bash
ffmpeg -i input_image.jpg -vf scale=800:-1 -q:v output_image.jpg
```

---

# Color Filters

### Adjust Brightness

```bash
ffmpeg -i sample1.jpg -vf "eq=brightness=0.06" obright.jpg
```

### Adjust Contrast

```bash
ffmpeg -i input.jpg -vf "eq=contrast=1.5" output.jpg
```

### Adjust Saturation

```bash
ffmpeg -i input.jpg -vf "eq=saturation=1.8" output.jpg
```

### Convert to Black & White

```bash
ffmpeg -i input.jpg -vf "format=gray" output.jpg
```

### Flip Horizontally

```bash
ffmpeg -i input.jpg -vf "hflip" output.jpg
```

### Flip Vertically

```bash
ffmpeg -i input.jpg -vf "vflip" output.jpg
```

---

# `ffprobe` Analysis

## Simple Analysis

```bash
ffprobe -i input.ts
```

## Verbose and JSON Output

```bash
ffprobe -v verbose -show_format -show_streams input.ts
ffprobe -v quiet -print_format json -show_format -show_streams input.ts
```

---

# Explanation

* `-c:v libx264`: Specifies the video codec.
* `-b:v 1M`: Sets constant bitrate (CBR) to 1 Mbps. Use values like 100k, 200k, 500k, 1M, 2M.
* `-vf scale=1280:720`: Resizes video to 720p using video filters (vf).

  * **Uses**:

    * Resizing
    * Cropping
    * Effects (filters, text overlays)
    * Color correction
    * Stabilization
    * Deinterlacing
  * **Chaining filters**:
    `-vf scale=640:480,boxblur=luma_radius=10:luma_power=2`
* `-crf 28`: CRF (1–30), lower means better quality and larger size.
* `-vn`: Ignore video stream (useful for extracting audio).
* `-an`: Ignore audio stream (useful for silent videos).

---

# Helpful Documentation

📘 [FFmpeg Official Docs](https://ffmpeg.org/ffmpeg.html)

---

Would you like a downloadable version of this as a `.md` file?
