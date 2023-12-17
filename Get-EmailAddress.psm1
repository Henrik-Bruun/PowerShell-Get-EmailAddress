Function Get-EmailAddress {
    <#
    .SYNOPSIS
        Extracts email addresses from text or input.
    .DESCRIPTION
        This function extracts email addresses from text or input.
    .PARAMETER email
        The email address or multiple addresses.
    .EXAMPLE
        Get-EmailAddress "john@example.com"
    .EXAMPLE
        Get-EmailAddress "john@example.com;DOE@example.com"
    .EXAMPLE
        Get-EmailAddress (Get-Content .\sample.txt)
    .NOTES
        Author: Henrik Bruun  Github.com @Henrik-Bruun
        Version: 1.0 2023 December.
        Version: 0.9 2023 January - Not public.
    #>

    Param (
        [String]$email = 'sample@example.com'
    )

    # Regex for extracting email addresses
    $regexString = '[a-zA-Z0-9.\-_+]{1,255}@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z0-9][a-zA-Z0-9-]{0,61}[a-zA-Z0-9]'
    
    # Extract email addresses using regex
    $out = ($email | Select-String -Pattern $regexString -AllMatches -ErrorAction SilentlyContinue).Matches.Value 

    # Output unique, lowercase email addresses
    if ($out -ne $null) {
        $out.ToLower() | Sort-Object -ErrorAction SilentlyContinue | Get-Unique
    }
}
