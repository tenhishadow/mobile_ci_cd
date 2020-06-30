# notes:
".keystore" files are depricated and it's recommended to generate .jks

-validity is better to set as 10 years cause Google wont' accept apks with cert for just one year(я тоже в шоке)

# to generate keystore_for_android:
```
keytool -genkey \
  -alias alias_name \
  -keyalg RSA \
  -keystore filename.jks \
  -keysize 2048 \
  -validity XX
```

# to get info about keystore
```
keytool -list -v -keystore filename.jks
```

# dname ref:
```
              CN=Ivan Ivanov
              OU=Ivanko Engineering
              O=Company
              L=York
              S=York
              C=GB
```

# full example:
```
keytool -genkey \
  -dname "CN=Ivan Ivanov, OU=Ivanko Engineering, O=Company, L=York,S=York, C=GB" \
  -alias "asyouwish" \
  -keyalg RSA \
  -keystore WhiteLabelCustomer.jks \
  -keysize 2048 \
  -validity 73000
```
