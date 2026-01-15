{ lib, config, pkgs, ... }: {

  options = {
    noctalia_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of Noctalia with home-manager";
  };

  config = lib.mkIf config.noctalia_home-manager.enable {
    home.packages = with pkgs; [
      quickshell
    ];

    programs.noctalia-shell = lib.mkForce {
      enable = true;
      settings = {
        appLauncher = {
          customLaunchPrefix = "";
          customLaunchPrefixEnabled = false;
          enableClipPreview = true;
          enableClipboardHistory = false;
          pinnedExecs = [];
          position = "follow_bar";
          showCategories = true;
          sortByMostUsed = true;
          terminalCommand = "xterm -e";
          useApp2Unit = false;
          viewMode = "grid";
        };
        audio = {
          cavaFrameRate = 30;
          externalMixer = "pwvucontrol || pavucontrol";
          mprisBlacklist = [];
          preferredPlayer = "";
          visualizerQuality = "high";
          visualizerType = "linear";
          volumeOverdrive = false;
          volumeStep = 5;
        };
        bar = {
          backgroundOpacity = 0;
          capsuleOpacity = 1;
          density = "default";
          exclusive = true;
          floating = false;
          marginHorizontal = 0.25;
          marginVertical = 0.25;
          monitors = [];
          outerCorners = false;
          position = "top";
          showCapsule = true;
          widgets = {
            center = [];
            left = [
              {
                colorizeDistroLogo = false;
                colorizeSystemIcon = "none";
                customIconPath = "";
                enableColorization = false;
                icon = "noctalia";
                id = "ControlCenter";
                useDistroLogo = true;
              }
              {
                characterCount = 2;
                followFocusedScreen = false;
                hideUnoccupied = false;
                id = "Workspace";
                labelMode = "none";
              }
              {
                hideMode = "hidden";
                hideWhenIdle = false;
                id = "MediaMini";
                maxWidth = 145;
                scrollingMode = "hover";
                showAlbumArt = true;
                showArtistFirst = true;
                showProgressRing = true;
                showVisualizer = false;
                useFixedWidth = false;
                visualizerType = "linear";
              }
            ];
            right = [
              {
                blacklist = [];
                colorizeIcons = false;
                drawerEnabled = false;
                id = "Tray";
                pinned = [];
              }
              {
                displayMode = "onhover";
                id = "Volume";
              }
              {
                displayMode = "onhover";
                id = "Bluetooth";
              }
              {
                displayMode = "onhover";
                id = "WiFi";
              }
              {
                customFont = "Liberation Sans";
                formatHorizontal = "MMM dd h:mm AP";
                formatVertical = "HH mm - dd MM";
                id = "Clock";
                useCustomFont = true;
                usePrimaryColor = false;
              }
              {
                colorName = "error";
                id = "SessionMenu";
              }
            ];
          };
        };
        brightness = {
          brightnessStep = 5;
          enableDdcSupport = false;
          enforceMinimum = true;
        };
        calendar = {
          cards = [
            {
              enabled = true;
              id = "calendar-header-card";
            }
            {
              enabled = true;
              id = "calendar-month-card";
            }
            {
              enabled = false;
              id = "timer-card";
            }
            {
              enabled = false;
              id = "weather-card";
            }
          ];
        };
        colorSchemes = {
          darkMode = true;
          generateTemplatesForPredefined = true;
          manualSunrise = "06:30";
          manualSunset = "18:30";
          matugenSchemeType = "scheme-fruit-salad";
          predefinedScheme = "Tokyo Night";
          schedulingMode = "off";
          useWallpaperColors = false;
        };
        controlCenter = {
          cards = [
            {
              enabled = true;
              id = "profile-card";
            }
            {
              enabled = true;
              id = "shortcuts-card";
            }
            {
              enabled = true;
              id = "audio-card";
            }
            {
              enabled = true;
              id = "weather-card";
            }
            {
              enabled = false;
              id = "media-sysmon-card";
            }
          ];
          position = "close_to_bar_button";
          shortcuts = {
            left = [
              {
                id = "Bluetooth";
              }
              {
                id = "WiFi";
              }
            ];
            right = [
              {
                id = "Notifications";
              }
              {
                id = "ScreenRecorder";
              }
              {
                id = "NightLight";
              }
            ];
          };
        };
        dock = {
          backgroundOpacity = 1;
          colorizeIcons = false;
          displayMode = "always_visible";
          enabled = false;
          floatingRatio = 1;
          monitors = [
          ];
          onlySameOutput = false;
          pinnedApps = [];
          size = 1;
        };
        general = {
          allowPanelsOnScreenWithoutBar = true;
          animationDisabled = false;
          animationSpeed = 1;
          avatarImage = "/home/s3mango/.face";
          boxRadiusRatio = 1;
          compactLockScreen = false;
          dimmerOpacity = 0.5;
          enableShadows = true;
          forceBlackScreenCorners = false;
          iRadiusRatio = 1;
          language = "";
          lockOnSuspend = true;
          radiusRatio = 1;
          scaleRatio = 1;
          screenRadiusRatio = 1;
          shadowDirection = "bottom_right";
          shadowOffsetX = 2;
          shadowOffsetY = 3;
          showHibernateOnLockScreen = false;
          showScreenCorners = false;
        };
        hooks = {
          darkModeChange = "";
          enabled = false;
          wallpaperChange = "";
        };
        location = {
          analogClockInCalendar = false;
          firstDayOfWeek = -1;
          showCalendarEvents = true;
          showCalendarWeather = true;
          showWeekNumberInCalendar = false;
          use12hourFormat = true;
          useFahrenheit = true;
          weatherEnabled = true;
          weatherShowEffects = true;
        };
        network = {
          wifiEnabled = true;
        };
        nightLight = {
          autoSchedule = true;
          dayTemp = "6500";
          enabled = false;
          forced = false;
          manualSunrise = "06:30";
          manualSunset = "18:30";
          nightTemp = "4000";
        };
        notifications = {
          backgroundOpacity = 0.5;
          criticalUrgencyDuration = 15;
          enableKeyboardLayoutToast = true;
          enabled = true;
          location = "top_right";
          lowUrgencyDuration = 3;
          monitors = [];
          normalUrgencyDuration = 8;
          overlayLayer = true;
          respectExpireTimeout = false;
        };
        osd = {
          autoHideMs = 2000;
          backgroundOpacity = 1;
          enabled = true;
          enabledTypes = [
            0
            1
            2
          ];
          location = "top_right";
          monitors = [];
          overlayLayer = true;
        };
        screenRecorder = {
          audioCodec = "opus";
          audioSource = "both";
          colorRange = "limited";
          directory = "/home/s3mango/Videos";
          frameRate = 60;
          quality = "very_high";
          showCursor = true;
          videoCodec = "h264";
          videoSource = "portal";
        };
        sessionMenu = {
          countdownDuration = 10000;
          enableCountdown = false;
          position = "center";
          powerOptions = [
            {
              action = "lock";
              command = "";
              countdownEnabled = false;
              enabled = true;
            }
            {
              action = "suspend";
              command = "";
              countdownEnabled = false;
              enabled = true;
            }
            {
              action = "hibernate";
              command = "";
              countdownEnabled = false;
              enabled = true;
            }
            {
              action = "reboot";
              command = "";
              countdownEnabled = false;
              enabled = true;
            }
            {
              action = "logout";
              command = "";
              countdownEnabled = false;
              enabled = true;
            }
            {
              action = "shutdown";
              command = "";
              countdownEnabled = false;
              enabled = true;
            }
          ];
          showHeader = true;
        };
        settingsVersion = 26;
        systemMonitor = {
          cpuCriticalThreshold = 90;
          cpuPollingInterval = 3000;
          cpuWarningThreshold = 80;
          criticalColor = "";
          diskCriticalThreshold = 90;
          diskPollingInterval = 3000;
          diskWarningThreshold = 80;
          memCriticalThreshold = 90;
          memPollingInterval = 3000;
          memWarningThreshold = 80;
          networkPollingInterval = 3000;
          tempCriticalThreshold = 90;
          tempPollingInterval = 3000;
          tempWarningThreshold = 80;
          useCustomColors = false;
          warningColor = "";
        };
        templates = {
          alacritty = false;
          cava = false;
          code = false;
          discord = false;
          emacs = false;
          enableUserTemplates = false;
          foot = false;
          fuzzel = false;
          ghostty = false;
          gtk = false;
          kcolorscheme = false;
          kitty = false;
          niri = false;
          pywalfox = false;
          qt = false;
          spicetify = false;
          telegram = false;
          vicinae = false;
          walker = false;
          wezterm = false;
        };
        ui = {
          fontDefault = "Sans Serif";
          fontDefaultScale = 1;
          fontFixed = "Courier New";
          fontFixedScale = 1;
          panelBackgroundOpacity = 1;
          panelsAttachedToBar = true;
          settingsPanelAttachToBar = false;
          tooltipsEnabled = true;
        };
        wallpaper = {
          enabled = false;
        };
      };
    };
    home.file.".config/noctalia/colorschemes/Stylix/Stylix.json".text = ''
      {
          "mError": "${config.stylix.base16Scheme.base08}",
          "mHover": "${config.stylix.base16Scheme.base0D}",
          "mOnError": "${config.stylix.base16Scheme.base01}",
          "mOnHover": "${config.stylix.base16Scheme.base01}",
          "mOnPrimary": "${config.stylix.base16Scheme.base01}",
          "mOnSecondary": "${config.stylix.base16Scheme.base01}",
          "mOnSurface": "${config.stylix.base16Scheme.base05}",
          "mOnSurfaceVariant": "${config.stylix.base16Scheme.base05}",
          "mOnTertiary": "${config.stylix.base16Scheme.base01}",
          "mOutline": "${config.stylix.base16Scheme.base0D}",
          "mPrimary": "${config.stylix.base16Scheme.base0D}",
          "mSecondary": "${config.stylix.base16Scheme.base0C}",
          "mShadow": "${config.stylix.base16Scheme.base00}",
          "mSurface": "${config.stylix.base16Scheme.base00}",
          "mSurfaceVariant": "${config.stylix.base16Scheme.base01}",
          "mTertiary": "${config.stylix.base16Scheme.base05}"
      }
    '';
  };
}
