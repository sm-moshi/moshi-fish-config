function dedup
    echo "Finding duplicate files in the current directory..."
    set -l duplicates_file /tmp/fclones.json
    fclones group . > $duplicates_file

    if test (wc -l < $duplicates_file) -eq 0
        echo "No duplicate files found."
        rm -f $duplicates_file
        return
    end

    echo "Duplicate files found. Proceed with deduplication? (y/N)"
    read -l response
    if string match -qi 'y*' -- $response
        echo "Deduplicating files..."
        fclones dedupe < $duplicates_file
    else
        echo "Deduplication aborted."
        rm -f $duplicates_file
        return
    end

    if command -v applesauce >/dev/null
        echo "Applying APFS compression..."
        applesauce compress .
    else
        echo "applesauce not found. Skipping APFS compression."
    end

    echo "Deduplication and compression complete!"
    rm -f $duplicates_file
end