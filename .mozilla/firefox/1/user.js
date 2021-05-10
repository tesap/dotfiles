// Spyware
user_pref("browser.selfsupport.url", "");
// IMPORTANT
user_pref("privacy.resistFingerprinting", true);
user_pref("privacy.firstparty.isolate", false);
user_pref("privacy.resistFingerprinting.letterboxing", false);
user_pref("privacy.donottrackheader.enabled", false);

user_pref("privacy.trackingprotection.cryptomining.enabled", true);
user_pref("privacy.trackingprotection.enabled", true);
user_pref("privacy.trackingprotection.fingerprinting.enabled", true);
user_pref("privacy.trackingprotection.pbmode.enabled", true);
user_pref("privacy.usercontext.about_newtab_segregation.enabled", true);
user_pref("privacy.window.name.update.enabled", true);

// Base
user_pref("geo.enabled", false);
user_pref("geo.provider.network.url", "");
user_pref("extensions.pocket.enabled", false);   // Pocket Integration
user_pref("identity.fxaccounts.enabled", false); // Account
// user_pref("media.peerconnection.enabled", false);// WebRTC
user_pref("dom.serviceWorkers.enabled", false);  // Service Workers
user_pref("dom.push.enabled", false)             // Notifications
user_pref("javascript.options.wasm", true);      // WebAssembly = TRUE
user_pref("media.navigator.enabled", false);     // Microphone, Campera
user_pref("media.eme.enabled", false);           // DRM

// Window
user_pref("browser.startup.homepage", "about:home");
// user_pref("browser.startup.homepage", "searx.bar");
user_pref("browser.link.open_newwindow", 3); // 1=most recent window or tab 2=new window, 3=new tab
user_pref("browser.link.open_newwindow.restriction", 0); // 0-disable, 2=enable
user_pref("browser.toolbars.bookmarks.visibility", "always");
user_pref("extensions.activeThemeID", "firefox-compact-dark@mozilla.org");

// --- Tabs ---
// user_pref("browser.tabs.allowTabDetach", false);
user_pref("network.prefetch-next", false);
user_pref("network.predictor.enabled", false);
user_pref("network.predictor.enable-prefetch", false);
user_pref("browser.newtab.preload", false);

// user_pref("browser.newtabpage.enabled", false); // Blank on new tab
user_pref("browser.newtabpage.activity-stream.feeds.topsites", false);
user_pref("browser.newtabpage.activity-stream.showSponsored", false);
user_pref("browser.newtabpage.activity-stream.feeds.section.highlights", false);
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);
user_pref("browser.newtabpage.activity-stream.feeds.discoverystreamfeed", false); // [FF66+]
user_pref("browser.newtabpage.activity-stream.feeds.snippets", false);
user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
user_pref("browser.newtabpage.activity-stream.section.highlights.includePocket", false);
user_pref("browser.newtabpage.activity-stream.telemetry", false);
user_pref("browser.tabs.loadBookmarksInTabs", true); // open bookmarks in a new tab
user_pref("browser.tabs.closeWindowWithLastTab", true);            // whether to close the browser when the last tab is closed

user_pref("browser.tabs.warnOnClose", false);
user_pref("browser.tabs.warnOnCloseOtherTabs", false);

// --- URL Search ---
// user_pref("keyword.enabled", true);
user_pref("browser.urlbar.trimURLs", false);
user_pref("browser.urlbar.formatting.enabled", true);
user_pref("browser.urlbar.suggest.searches", false);
user_pref("browser.urlbar.suggest.topsites", false);
user_pref("browser.fixup.alternate.enabled", false); // Disables www prefix addition
user_pref("browser.search.suggest.enabled", false);
user_pref("network.IDN_show_punycode", true);

user_pref("browser.urlbar.placeholderName", "DuckDuckGo");
 
// --- Homepage ---
user_pref("startup.homepage_override_url", "");                     // [PRIV=""] 'What's New' page after browser update
user_pref("startup.homepage_welcome_url", "");                      // [PRIV=""] 'Welcome' URL
user_pref("startup.homepage_welcome_url.additional", "");           // [PRIV=""] 'Welcome' URL, additional


// user_pref("general.platform.override", "Win32");
// user_pref("general.useragent.override", "Mozilla/5.0 (Windows NT 6.1; rv:52.0) Gecko/20100101 Firefox/52.0");

// WebGl
user_pref("webgl.disabled", true);
user_pref("webgl.renderer-string-override", " ");
user_pref("webgl.vendor-string-override", " ");
// user_pref("webgl.enable-webgl2", false);
// user_pref("webgl.min_capability_mode", true);

// Addons
user_pref("browser.discovery.enabled", false);
user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);
user_pref("extensions.getAddons.showPane", false); // [HIDDEN PREF:

// Other
user_pref("ui.prefersReducedMotion", 1); // [HIDDEN PREF]
user_pref("security.OCSP.enabled", 0);
user_pref("dom.allow_cut_copy", true);
user_pref("browser.aboutConfig.showWarning", false);
user_pref("media.autoplay.default", 5);
user_pref("layout.spellcheckDefault", 0);

// --- Device API's & Sensors ---
user_pref("device.sensors.ambientLight.enabled", false);
user_pref("device.sensors.enabled", false);
user_pref("device.sensors.motion.enabled", false);
user_pref("device.sensors.orientation.enabled", false);
user_pref("device.sensors.proximity.enabled", false);
user_pref("dom.battery.enabled", false);
user_pref("dom.webaudio.enabled", false);
user_pref("beacon.enabled", false);

// Cache
// user_pref("browser.cache.offline.enable", false);
user_pref("browser.cache.offline.storage.enable", false);
user_pref("browser.sessionstore.privacy_level", 2);

// History

user_pref("privacy.history.custom", true);
user_pref("privacy.sanitize.sanitizeOnShutdown", true);
ser_pref("places.history.enabled", false);

user_pref("privacy.clearOnShutdown.cookies", false); // FALSE
user_pref("privacy.clearOnShutdown.history", true); // FALSE
user_pref("privacy.clearOnShutdown.formdata", true);
user_pref("privacy.clearOnShutdown.siteSettings", true);

// Logins & Forms
// user_pref("browser.urlbar.autoFill", false);
user_pref("browser.formfill.enable", false);
user_pref("signon.rememberSignons", false);
user_pref("signon.formlessCapture.enabled", false);
user_pref("signon.autofillForms", false);
user_pref("signon.generation.enabled", false);
user_pref("signon.management.page.breach-alerts.enabled", false);
user_pref("extensions.formautofill.addresses.enabled", false);
user_pref("extensions.formautofill.available", "off");
user_pref("extensions.formautofill.creditCards.available", false);
user_pref("extensions.formautofill.creditCards.enabled", false);
user_pref("extensions.formautofill.heuristics.enabled", false);

// Net
user_pref("network.trr.mode", 0);
user_pref("network.dns.disablePrefetch", true);
user_pref("network.dns.disablePrefetchFromHTTPS", true);

// Telemetry
user_pref("app.update.auto", false);
user_pref("app.normandy.enabled", false);
user_pref("app.normandy.api_url", "");
user_pref("app.shield.optoutstudies.enabled", false);

user_pref("browser.send_pings", false);
user_pref("browser.shell.checkDefaultBrowser", false);
user_pref("breakpad.reportURL", "");

user_pref("network.captive-portal-service.enabled", false);
user_pref("network.connectivity-service.enabled", false);
user_pref("captivedetect.canonicalURL", "");
user_pref("browser.crashReports.unsubmittedCheck.autoSubmit2", false); // [DEFAULT: false]
user_pref("browser.tabs.crashReporting.sendReport", false); // [FF44+]

user_pref("browser.crashReports.unsubmittedCheck.autoSubmit", false);
user_pref("browser.crashReports.unsubmittedCheck.autoSubmit2", false);
user_pref("browser.crashReports.unsubmittedCheck.enabled", false);

user_pref("datareporting.healthreport.service.enabled", false);
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.policy.dataSubmissionEnabled", false);

user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.server", "");
user_pref("toolkit.telemetry.prompted", 2);
user_pref("toolkit.telemetry.rejected", true);
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("toolkit.telemetry.bhrPing.enabled", false);
user_pref("toolkit.telemetry.cachedClientID", "");
user_pref("toolkit.telemetry.hybridContent.enabled", false);
user_pref("toolkit.telemetry.newProfilePing.enabled", false);
user_pref("toolkit.telemetry.reportingpolicy.firstRun", false);
user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);
user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
user_pref("toolkit.telemetry.unifiedIsOptIn", false);
user_pref("toolkit.telemetry.updatePing.enabled", false);

user_pref("toolkit.telemetry.coverage.opt-out", true); // [HIDDEN PREF]
user_pref("toolkit.coverage.opt-out", true); // [FF64+] [HIDDEN PREF]
user_pref("toolkit.coverage.endpoint.base", "");

// Safe browsing

user_pref("browser.safebrowsing.malware.enabled", false);
user_pref("browser.safebrowsing.phishing.enabled", false);

user_pref("services.sync.prefs.sync.browser.safebrowsing.phishing.enabled", false);
user_pref("services.sync.prefs.sync.browser.safebrowsing.malware.enabled", false); 
user_pref("services.sync.prefs.sync.browser.safebrowsing.downloads.enabled", false); 
user_pref("services.sync.prefs.sync.browser.safebrowsing.downloads.remote.block_potentially_unwanted", false);

user_pref("browser.safebrowsing.enabled", false);
user_pref("browser.safebrowsing.downloads.enabled", false);
user_pref("browser.safebrowsing.appRepURL", "");
user_pref("browser.safebrowsing.blockedURIs.enabled", false);

user_pref("browser.safebrowsing.downloads.remote.url", "");
user_pref("browser.safebrowsing.downloads.remote.enabled", false);
user_pref("browser.safebrowsing.downloads.remote.block_uncommon", false);

user_pref("browser.safebrowsing.provider.google.advisoryURL", "");
user_pref("browser.safebrowsing.provider.google.advisoryName", "");
user_pref("browser.safebrowsing.provider.google.lists", "");

user_pref("browser.safebrowsing.provider.google4.dataSharing.enabled", false);
user_pref("browser.safebrowsing.provider.google4.advisoryURL", "");
user_pref("browser.safebrowsing.provider.google4.dataSharingURL", "");
user_pref("browser.safebrowsing.provider.google4.lists", "");
user_pref("browser.safebrowsing.provider.google4.gethashURL", "");  // [SET] [SAFE=(default value)] [PRIV=""] URL used to check integrity of safe browsing lists
user_pref("browser.safebrowsing.provider.google4.reportURL", "");   // [PRIV=""] URL where safe browsing reports are sent
user_pref("browser.safebrowsing.provider.google4.updateURL", "");   // [SET] [SAFE=(default value)] [PRIV=""] URL where safe browsing lists are located

user_pref("browser.safebrowsing.provider.mozilla.gethashURL", "");
user_pref("browser.safebrowsing.provider.mozilla.updateURL", "");
user_pref("browser.safebrowsing.provider.mozilla.lists", "");

user_pref("services.settings.server", "");
// user_pref("extensions.blocklist.itemURL", "");
// user_pref("extensions.blocklist.detailsURL", "");
// user_pref("extensions.blocklist.addonItemURL", "");

// External links
user_pref("accessibility.support.url", "");
user_pref("app.feedback.baseURL", "");
user_pref("app.normandy.shieldLearnMoreUrl", "");
user_pref("app.releaseNotesURL", "");
user_pref("app.releaseNotesURL.aboutDialog", "");
user_pref("app.support.baseURL", "");
user_pref("app.update.url.details", "");
user_pref("app.update.url.manual", "");
user_pref("browser.chrome.errorReporter.infoURL", "");
user_pref("browser.contentblocking.report.cookie.url", "");
user_pref("browser.contentblocking.report.cryptominer.url", "");
user_pref("browser.contentblocking.report.endpoint_url", "");
user_pref("browser.contentblocking.report.fingerprinter.url", "");
user_pref("browser.contentblocking.report.lockwise.how_it_works.url", "");
user_pref("browser.contentblocking.report.manage_devices.url", "");
user_pref("browser.contentblocking.report.mobile-android.url", "");
user_pref("browser.contentblocking.report.mobile-ios.url", "");
user_pref("browser.contentblocking.report.monitor.home_page_url", "");
user_pref("browser.contentblocking.report.monitor.how_it_works.url", "");
user_pref("browser.contentblocking.report.monitor.preferences_url", "");
user_pref("browser.contentblocking.report.monitor.sign_in_url", "");
user_pref("browser.contentblocking.report.monitor.url", "");
user_pref("browser.contentblocking.report.proxy_extension.url", "");
user_pref("browser.contentblocking.report.social.url", "");
user_pref("browser.contentblocking.report.tracker.url", "");
user_pref("browser.contentblocking.report.vpn-android.url", "");
user_pref("browser.contentblocking.report.vpn-ios.url", "");
user_pref("browser.contentblocking.report.vpn-promo.url", "");
user_pref("browser.contentblocking.report.vpn.url", "");
user_pref("browser.contentblocking.reportBreakage.url", "");
user_pref("browser.dictionaries.download.url", "");
user_pref("browser.geolocation.warning.infoURL", "");
user_pref("browser.hiddenWindowChromeURL", "");
user_pref("browser.partnerlink.attributionURL", "");
user_pref("browser.privatebrowsing.vpnpromourl", "");
user_pref("browser.region.network.url", "");
user_pref("browser.safebrowsing.provider.google.gethashURL", "");
user_pref("browser.safebrowsing.provider.google.reportMalwareMistakeURL", "");
user_pref("browser.safebrowsing.provider.google.reportPhishMistakeURL", "");
user_pref("browser.safebrowsing.provider.google.reportURL", "");
user_pref("browser.safebrowsing.provider.google.updateURL", "");
user_pref("browser.safebrowsing.provider.google4.reportMalwareMistakeURL", "");
user_pref("browser.safebrowsing.provider.google4.reportPhishMistakeURL", "");
user_pref("browser.safebrowsing.reportPhishURL", "");
user_pref("browser.search.searchEnginesURL", "");
user_pref("browser.uitour.url", "");
user_pref("browser.xr.warning.infoURL", "");
user_pref("datareporting.healthreport.infoURL", "");
user_pref("datareporting.policy.firstRunURL", "");
user_pref("devtools.devices.url", "");
user_pref("devtools.performance.recording.ui-base-url", "");
user_pref("devtools.remote.adb.extensionURL", "");
user_pref("dom.push.serverURL", "");
user_pref("extensions.abuseReport.amoDetailsURL", "");
user_pref("extensions.abuseReport.url", "");
user_pref("extensions.blocklist.addonItemURL", "");
user_pref("extensions.blocklist.detailsURL", "");
user_pref("extensions.blocklist.itemURL", "");
user_pref("extensions.getAddons.discovery.api_url", "");
user_pref("extensions.getAddons.get.url", "");
user_pref("extensions.getAddons.langpacks.url", "");
user_pref("extensions.getAddons.link.url", "");
user_pref("extensions.getAddons.search.browseURL", "");
user_pref("extensions.recommendations.privacyPolicyUrl", "");
user_pref("extensions.recommendations.themeRecommendationUrl", "");
user_pref("extensions.systemAddon.update.url", "");
user_pref("extensions.update.background.url", "");
user_pref("extensions.update.url", "");
user_pref("identity.fxaccounts.service.monitorLoginUrl", "");
user_pref("identity.sendtabpromo.url", "");
user_pref("lightweightThemes.getMoreURL", "");
user_pref("media.gmp-manager.url", "");
user_pref("network.connectivity-service.IPv4.url", "");
user_pref("network.connectivity-service.IPv6.url", "");
user_pref("signon.management.page.breachAlertUrl", "");
user_pref("toolkit.crashreporter.infoURL", "");
user_pref("toolkit.datacollection.infoURL", "");
user_pref("urlclassifier.disallow_completions", "");
user_pref("webchannel.allowObject.urlWhitelist", "");
user_pref("webextensions.storage.sync.serverURL", "");
user_pref("xpinstall.signatures.devInfoURL", "");


user_pref("_user.js.parrot", "DONE!");
