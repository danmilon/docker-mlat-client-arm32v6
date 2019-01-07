# mutability/mlat-client arm32v6 docker container image #

A docker container image for
[mutability/mlat-client](https://github.com/mutability/mlat-client) based on
alpine linux, for the arm32v6 architecture.

It includes both `mlat-client` and `fa-mlat-client`.

## How to run ##

It doesn't need anything special. Here's the `mlat-client` help:

    $ docker run --rm danmilon/mlat-client-arm32v6 mlat-client --help
    usage: mlat-client [-h]
                       [--input-type {auto,dump1090,beast,radarcape_12mhz,radarcape_gps,radarcape,sbs,avrmlat}]
                       --input-connect INPUT_CONNECT [--results RESULTS]
                       [--no-anon-results] [--no-modeac-results] --lat LAT --lon
                       LON --alt ALT [--privacy] --user USER [--server SERVER]
                       [--no-udp]

    Client for multilateration.

    optional arguments:
      -h, --help            show this help message and exit

    Mode S receiver input connection:
      --input-type {auto,dump1090,beast,radarcape_12mhz,radarcape_gps,radarcape,sbs,avrmlat}
                            Sets the input receiver type.
      --input-connect INPUT_CONNECT
                            host:port to connect to for Mode S traffic. Required.

    Results output:
      --results RESULTS     <protocol>,connect,host:port or
                            <protocol>,listen,port. Protocol may be 'basestation',
                            'ext_basestation', or 'beast'. Can be specified
                            multiple times.
      --no-anon-results     Do not generate results for anonymized aircraft
      --no-modeac-results   Do not generate results for Mode A/C tracks

    Receiver location:
      --lat LAT             Latitude of the receiver, in decimal degrees.
                            Required.
      --lon LON             Longitude of the receiver, in decimal degrees.
                            Required.
      --alt ALT             Altitude of the receiver (height above ellipsoid).
                            Required. Defaults to metres, but units may specified
                            with a 'ft' or 'm' suffix. (Except if they're negative
                            due to option parser weirdness. Sorry!)
      --privacy             Sets the privacy flag for this receiver. Currently,
                            this removes the receiver location pin from the
                            coverage maps.

    Multilateration server connection:
      --user USER           User information to give to the server. Used to get in
                            touch if there are problems.
      --server SERVER       host:port of the multilateration server to connect to
      --no-udp              Don't offer to use UDP transport for sync/mlat
                            messages
