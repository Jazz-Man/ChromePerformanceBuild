#!/usr/bin/env bash

#  Script.sh
#  SHApplicaiton
#
#  Created by JazzMan on 17.12.2019.
#  Copyright © 2019 JazzMan. All rights reserved.

CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"

FEATURES_ARRAY=(
AutofillEnableToolbarStatusChip
EnablePasswordsAccountStorage
GlobalMediaControls
ImprovedCookieControls
NativeNotifications
OmniboxDisableInstantExtendedLimit
OmniboxDocumentProvider
OmniboxMaterialDesignWeatherIcons
OmniboxMaxURLMatches
OmniboxPedalSuggestions
OmniboxTabSwitchSuggestions
OmniboxTabSwitchSuggestionsDedicatedRow
OmniboxUIExperimentMaxAutocompleteMatches
OmniboxUIExperimentShowSuggestionFavicons
OmniboxZeroSuggestionsOnNTP
OmniboxZeroSuggestionsOnNTPRealbox
OmniboxZeroSuggestionsOnSERP

ParallelDownloading
PasswordLeakDetection
QueryInOmnibox
StoragePressureUI
SyncUSSPasswords
TabGroups
WebRtcHideLocalIpsWithMdns
fill-on-account-select
google-password-manager
);

CHROME_FLAGS=(
#Switches list start
flag-switches-begin
allow-insecure-localhost
enable-devtools-experiments
enable-experimental-web-platform-features
enable-gpu-rasterization
javascript-harmony
enable-oop-rasterization
enable-quic
show-autofill-signatures
ignore-gpu-blacklist
flag-switches-end
#Switches list end

enable-audio-service-sandbox
process-per-site
start-maximized
enable-dom-distiller
);

function join { local IFS="$1"; shift; echo "$*"; }

function join_by { local d=$1; shift; echo -n "$1"; shift; printf "%s" "${@/#/$d}"; }

FEATURES=$(join , "${FEATURES_ARRAY[@]}")
FLAGS=--$(join_by ' --' "${CHROME_FLAGS[@]}")

command "$CHROME" "$FLAGS" --enable-features="$FEATURES"
