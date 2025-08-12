/*
* Purpose: Generates a dynamic SQL query to calculate null analysis statistics for LendingClub accepted loans table
* Output: Creates COUNT and PERCENTAGE calculations for all columns (except issue_d)
* Usage: The output of this query should be used as a subquery in a larger null analysis query
*
* Example output format:
*    COUNT(column1) AS column1_non_null_count,
*    ROUND((COUNT(column1) * 100.0 / COUNT(*)), 2) AS column1_non_null_pct,
*    COUNT(column2) AS column2_non_null_count,
*    ROUND((COUNT(column2) * 100.0 / COUNT(*)), 2) AS column2_non_null_pct
*/


SELECT string_agg(
    format(
        '    COUNT(%I) AS %I, ' ||
        'ROUND((COUNT(%I) * 100.0 / COUNT(*)), 2) AS %I',
        column_name,
        column_name || '_non_null_count', -- This concatenates the strings BEFORE quoting
        column_name,
        column_name || '_non_null_pct'      -- This does the same for the percentage column
    ),
    E',\n'
)
FROM information_schema.columns
WHERE table_schema = 'lending_club'
  AND table_name   = 'accepted'
  AND column_name != 'issue_d';