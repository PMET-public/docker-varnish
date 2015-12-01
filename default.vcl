vcl 4.0;
 
import std;
# The minimal Varnish version is 4.0
 
backend default {
    .host = "app-server";
    .port = "80";
}
