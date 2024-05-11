; sql
; ((string) @sql (#contains? @sql "SELECT" "INSERT" "UPDATE" "DELETE" "CREATE" "ALTER") (#offset! @sql 1 0 -1 0))

(string
  (string_start) @start
  (string_content) @injection.content
    (#match? @start "^[\"']{3}")
    (#set! injection.language "sql"))
