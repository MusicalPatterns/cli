. bin/non_cli/share_file.sh

share_files() {
	while read SHARED_FILE ; do
		echo "doing it for"${SHARED_FILE}
		share_file "$SHARED_FILE"
	done < bin/non_cli/shared_files.txt
}
export -f share_files
