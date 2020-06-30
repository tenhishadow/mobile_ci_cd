 To generate keystore_for_android:
   keytool -genkey -alias alias_name -keyalg RSA -keystore filename.jks -keysize 2048 -validity 36500

 to get info about keystore
   keytool -list -v -keystore filename.jks
   ".keystore" files are depricated

 dname ref:
              CN=Ivan Ivanov
              OU=Ivanko Engineering
              O=Company
              L=York
              S=York
              C=GB

keytool -genkey \
  -dname "CN=Ivan Ivanov, OU=Ivanko Engineering, O=Company, L=York,S=York, C=GB" \
  -alias "asyouwish" \
  -keyalg RSA \
  -keystore WhiteLabelCustomer.jks \
  -keysize 2048 \
  -validity 73000

 -validity 73000 - yes, Google Play Market won't approve one-year signed apps!
