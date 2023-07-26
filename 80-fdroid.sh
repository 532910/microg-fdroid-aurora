#!/sbin/sh
#
# ADDOND_VERSION=4
#
# /system/addon.d/80-fdroid.sh
# During a system upgrade, this script backs up F-Droid client and privext,
# /system is formatted and reinstalled, then the files are restored.
#

. /tmp/backuptool.functions

list_files() {
cat <<EOF
/product/etc/permissions/privapp-permissions-org.fdroid.fdroid.privileged.xml
/product/etc/permissions/privapp-permissions-com.aurora.services.xml
/product/etc/permissions/privapp-permissions-com.google.android.gms.xml
/product/etc/permissions/privapp-permissions-com.android.vending.xml
/product/app/F-Droid/F-Droid.apk
/product/priv-app/F-DroidPrivilegedExtension/F-DroidPrivilegedExtension.apk
/product/priv-app/AuroraServices/AuroraServices.apk
/product/priv-app/GmsCore/GmsCore.apk
/product/priv-app/FakeStore/FakeStore.apk
EOF
}

case "$1" in
  backup)
    list_files | while read FILE; do
      backup_file "$FILE"
    done
  ;;
  restore)
    list_files | while read FILE; do
      restore_file "$FILE"
    done
  ;;
  pre-backup)
    # Stub
  ;;
  post-backup)
    # Stub
  ;;
  pre-restore)
    # Stub
  ;;
  post-restore)
    # Stub
  ;;
esac
