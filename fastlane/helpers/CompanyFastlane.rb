#!/usr/bin/env ruby
# I am not Ruby programmer, I am yaml-developer. Feel free to open issue/PR to pay attention on something

class CompanyFastlane
  ANDROIDPROJECTDIR               = 'android/'
  PLAYMARKETSKIPUPLOADCHANGELOGS  = true
  PLAYMARKETSKIPUPLOADIMAGES      = true
  PLAYMARKETSKIPUPLOADSCREENSHOTS = true
  PLAYMARKETSKIPUPLOADMETADATA    = false
  PLAYMARKETTRACK                 = 'internal' # I use internal for local QA's, then it goes to closed beta and then to wide audience
  PLAYMARKETVALIDATEONLY          = false
  XCODEPROJECT                    = 'ios/Product.xcodeproj'
  XCODEWORKSPACE                  = 'ios/Product.xcworkspace'

  class BuildsInternal < CompanyFastlane
    APPLEDEVPORTALTEAM        = 'XXXXXXXXX' # from developer.apple.com
    FIREBASEGROUPTESTERS      = 'qa' # group managed in web-interface of Firebase
    FIREBASEINDIVIDUALTESTERS = 'qa_device@example.com' # you could commit it in VCS and you dont' rely on group managed via webui
    FIREBASERELEASENOTESFILE  = 'fastlane/helpers/beta_msg_placeholder.txt'
    GYMEXPORTMETHOD           = 'ad-hoc'
    MATCHGITBRANCH            = 'master'
    MATCHTYPE                 = 'adhoc'
    SHOWDEVMENU               = 'true' # special var for show devmenu, depends on application
    TESTFLIGHTTEAM            = 'Company, Inc.'
    def self.FirebaseCliToken
      ENV["FIREBASE_CLI_TOKEN"]
    end
    class Qa < BuildsInternal
      ANDROIDGRADLETASK  = 'clean assembleQaRelease'
      BUNDLEID           = 'com.company.CompanyProduct.qa'
      GOOGLESERVICEPLIST = 'GoogleService.qa-Info.plist'
      XCODESCHEME        = 'Product.qa'

      def self.FirebaseApplicationAndroid
        ENV["ANDROID_FIREBASE_APP_QA"]
      end
      def self.ProvisionProfile
        ENV["sigh_com.company.CompanyProduct.qa_adhoc_profile-path"] # you could also replace CompanyProduct with variable and refactor it. Depends on and as you wish. I am not Ruby programmer
      end
    end
    class Staging < BuildsInternal
      ANDROIDGRADLETASK  = 'clean assembleStagingRelease'
      BUNDLEID           = 'com.company.CompanyProduct.staging'
      GOOGLESERVICEPLIST = 'GoogleService.staging-Info.plist'
      XCODESCHEME        = 'Product.staging'

      def self.FirebaseApplicationAndroid
        ENV["ANDROID_FIREBASE_APP_STAGING"]
      end
      def self.ProvisionProfile
        ENV["sigh_com.company.CompanyProduct.staging_adhoc_profile-path"]
      end
    end
    class Production < BuildsInternal
      ANDROIDGRADLETASK  = 'clean assembleProductionRelease'
      BUNDLEID           = 'com.company.CompanyProduct'
      GOOGLESERVICEPLIST = 'GoogleService.release-Info.plist'
      GYMEXPORTMETHOD    = 'ad-hoc'
      MATCHTYPE          = 'adhoc'
      XCODESCHEME        = 'Product'

      def self.FirebaseApplicationAndroid
        ENV["ANDROID_FIREBASE_APP_PRODUCTION"]
      end
      def self.ProvisionProfile
        ENV["sigh_com.company.CompanyProduct_adhoc_profile-path"]
      end
    end
    class ProductionTestFlight < Production
      GYMEXPORTMETHOD    = 'app-store'
      MATCHTYPE          = 'appstore'

      def self.ProvisionProfile
        ENV["sigh_com.company.CompanyProduct_appstore_profile-path"]
      end
    end
  end

  class BuildsWhiteLabel < CompanyFastlane
    GYMEXPORTMETHOD = 'app-store'
    MATCHTYPE       = 'appstore'
    SHOWDEVMENU     = 'false'

    class WhiteLabelCustomer < BuildsWhiteLabel
      ANDROIDGRADLETASK  = 'clean assembleWhiteLabelCustomerRelease'
      APPLEDEVPORTALTEAM = 'JHKJHKJHKJHK'
      BACKAPPNAME        = 'xxxsdfsdfsdfsd'
      BUNDLEID           = 'com.WhiteLabelCustomer.Product'
      GOOGLESERVICEPLIST = 'GoogleService.WhiteLabelCustomer-Info.plist'
      MATCHGITBRANCH     = 'WhiteLabelCustomer'
      TESTFLIGHTTEAM     = 'WhiteLabelCustomer  LLC'
      XCODESCHEME        = 'WhiteLabelCustomer'

      def self.ProvisionProfile
        ENV["sigh_com.WhiteLabelCustomer.Product_appstore_profile-path"]
      end
    end
  end
end
