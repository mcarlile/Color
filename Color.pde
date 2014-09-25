color avgColor;
PImage img;
color [] pixelColors;
int r = 1;

void setup () {
  size (990, 742);
  String url = "http://images.nationalgeographic.com/wpf/media-live/photos/000/835/cache/mestia-svanetia-church-candles_83591_990x742.jpg";
  // Load image from a web server
  img = loadImage(url, "gif");
  loadPixels ();
  pixelColors = new color[pixels.length];
  println ("pixels: " + pixels.length);
  noStroke();
}

void draw () {
  //  image (webImg, 0, 0);
  loadPixels(); 
  // Since we are going to access the image's pixels too  
  img.loadPixels(); 
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int loc = x + y*width;

      // The functions red(), green(), and blue() pull out the 3 color components from a pixel.
      float r = red(img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);

      // Image Processing would go here
      // If we were to change the RGB values, we would do it here, before setting the pixel in the display window.

      // Set the display pixel to the image pixel
      pixels[loc] =  color(r, g, b);
      pixelColors[loc] = color(r, g, b);
    }
  }
  updatePixels();
  background (0);
  for (int i = 0; i < width; i = i + width/10) {
    int r = int(random(pixels.length)); 
    fill (pixelColors[r]);
    rect (i, 0, width/10, width/10);
    r=r+50;
  }
}

//Works Cited

//Heavy help from: http://processing.org/tutorials/pixels/
