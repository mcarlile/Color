color avgColor;
PImage img;
color [] pixelColors;
int r = 1;
int resolution = 10;
String [] urls = new String [10];

void setup () {
  size (800, 800);
  urls[0] = "http://images.nationalgeographic.com/wpf/media-live/photos/000/835/cache/mestia-svanetia-church-candles_83591_990x742.jpg";
  urls[1] = "http://images.nationalgeographic.com/wpf/media-live/photos/000/835/cache/owl-peeking-tree-northumberland_83592_990x742.jpg";
  urls[2] = "http://images.nationalgeographic.com/wpf/media-live/photos/000/835/cache/fishing-net-beach-vietnam_83585_990x742.jpg";
  urls[3] ="http://images.nationalgeographic.com/wpf/media-live/photos/000/835/cache/poland-summer-hay-jumping_83594_990x742.jpg";
  urls[4] ="http://images.nationalgeographic.com/wpf/media-live/photos/000/835/cache/pet-chameleon-scales-reptile_83593_990x742.jpg";
  urls[5] ="http://images.nationalgeographic.com/wpf/media-live/photos/000/835/overrides/arizona-aerial-irrigation-essick_83582_990x742.jpg";
  urls[6] ="http://images.nationalgeographic.com/wpf/media-live/photos/000/835/cache/lantern-festival-wish-thailand_83589_990x742.jpg";
  urls[7] ="http://images.nationalgeographic.com/wpf/media-live/photos/000/835/cache/ice-beach-breidamerkursandur-iceland_83588_990x742.jpg";
  urls[8] ="http://photography.nationalgeographic.com/photography/photo-of-the-day/prayer-papers-sichuan-china/";
  urls[9] ="http://images.nationalgeographic.com/wpf/media-live/photos/000/835/cache/autumn-morning-lithuania-fog_83583_990x742.jpg";
  // Load image from a web server
  img = loadImage(urls[0], "gif");
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
  for (int i = 0; i < width; i = i + width/resolution) {
    int r = int(random(pixels.length)); 
    fill (pixelColors[r]);
    rect (i, 0, width/resolution, height/resolution);
    r=r+50;
  }
}


//Works Cited

//Heavy help from: http://processing.org/tutorials/pixels/

