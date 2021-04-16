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
user_pref("dom.push.enabled", false)
user_pref("javascript.options.wasm", true);      // WebAssembly = TRUE
user_pref("media.navigator.enabled", false);     // Microphone, Campera
user_pref("media.eme.enabled", false);           // DRM

// Window
// user_pref("browser.startup.homepage", "searx.fmac.xyz");
user_pref("browser.link.open_newwindow", 3); // 1=most recent window or tab 2=new window, 3=new tab
user_pref("browser.link.open_newwindow.restriction", 0);
user_pref("browser.toolbars.bookmarks.visibility", "always");
user_pref("extensions.activeThemeID", "firefox-compact-dark@mozilla.org");
// user_pref("browser.uiCustomization.state", "{\"placements\":{\"widget-overflow-fixed-list\":[],\"nav-bar\":[\"back-button\",\"forward-button\",\"stop-reload-button\",\"home-button\",\"urlbar-container\",\"customizableui-special-spring2\",\"bookmarks-menu-button\",\"downloads-button\",\"sidebar-button\",\"fxa-toolbar-menu-button\"],\"toolbar-menubar\":[\"menubar-items\"],\"TabsToolbar\":[\"tabbrowser-tabs\",\"new-tab-button\",\"alltabs-button\"],\"PersonalToolbar\":[\"preferences-button\",\"developer-button\",\"open-file-button\",\"edit-controls\",\"personal-bookmarks\"]},\"seen\":[\"developer-button\"],\"dirtyAreaCache\":[\"nav-bar\",\"toolbar-menubar\",\"TabsToolbar\",\"PersonalToolbar\",\"widget-overflow-fixed-list\"],\"currentVersion\":16,\"newElementCount\":38}");

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

// Other
user_pref("ui.prefersReducedMotion", 1); // [HIDDEN PREF]
user_pref("security.OCSP.enabled", 0);
user_pref("dom.allow_cut_copy", false);
user_pref("browser.aboutConfig.showWarning", false);
user_pref("network.captive-portal-service.enabled", false);
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

user_pref("_user.js.parrot", "DONE!");
