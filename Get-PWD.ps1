function Get-PWD {
    $PasswordSuggestion = Invoke-WebRequest -UseBasicParsing -Uri "https://xkpasswd.net/s/index.cgi" `
        -Method "POST" `
        -Headers @{
        "Accept"           = "*/*"
        "Referer"          = "https://xkpasswd.net/s/"
        "X-Requested-With" = "XMLHttpRequest"
    } `
        -ContentType "application/x-www-form-urlencoded; charset=UTF-8" `
        -Body "a=genpw&n=3&c=%7B%22num_words%22%3A3%2C%22word_length_min%22%3A4%2C%22word_length_max%22%3A8%2C%22case_transform%22%3A%22ALTERNATE%22%2C%22separator_character%22%3A%22RANDOM%22%2C%22separator_alphabet%22%3A%5B%22!%22%2C%22%40%22%2C%22%24%22%2C%22%25%22%2C%22%5E%22%2C%22%26%22%2C%22*%22%2C%22-%22%2C%22_%22%2C%22%2B%22%2C%22%3D%22%2C%22%3A%22%2C%22%7C%22%2C%22~%22%2C%22%3F%22%2C%22%2F%22%2C%22.%22%2C%22%3B%22%5D%2C%22padding_digits_before%22%3A2%2C%22padding_digits_after%22%3A2%2C%22padding_type%22%3A%22FIXED%22%2C%22padding_character%22%3A%22RANDOM%22%2C%22symbol_alphabet%22%3A%5B%22!%22%2C%22%40%22%2C%22%24%22%2C%22%25%22%2C%22%5E%22%2C%22%26%22%2C%22*%22%2C%22-%22%2C%22_%22%2C%22%2B%22%2C%22%3D%22%2C%22%3A%22%2C%22%7C%22%2C%22~%22%2C%22%3F%22%2C%22%2F%22%2C%22.%22%2C%22%3B%22%5D%2C%22padding_characters_before%22%3A2%2C%22padding_characters_after%22%3A2%2C%22random_increment%22%3A%22AUTO%22%7D"
    $PWConverted = convertfrom-json $passwordsuggestion.content
    $svcPW = $PWConverted.passwords[0]
    $svcPW | clip
    return $svcPW
}
