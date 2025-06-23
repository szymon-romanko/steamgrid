package main

import (
	"fmt"
	"io"
	"net/url"
	"regexp"
)

const steamSearchUrl = `https://store.steampowered.com/search/?category1=998%2C994%2C21%2C10%2C997&term=` // category is set to exclude bundles
const regexPattern = `https:\/\/store\.steampowered\.com\/app\/(\d*)\/`

// updateIdForCustomGames searches Steam Store using the game name and updates the game's ID.
// For non-steam games that have page in steam store, we can update their ID and download art from steam server as normal
func updateIdForCustomGames(game *Game) error {
	// Search for the game on Steam
	formattedUrl := steamSearchUrl + url.QueryEscape(game.Name)
	response, err := tryDownload(formattedUrl)
	if err != nil || response == nil {
		return fmt.Errorf("downloading html: %w", err)
	}
	// Read the response body
	defer response.Body.Close()
	htmlBytes, err2 := io.ReadAll(response.Body)
	if err2 != nil {
		return fmt.Errorf("reading response body: %w", err2)
	}
	html := string(htmlBytes)
	// Get the first match using regex
	re, err := regexp.Compile(regexPattern)
	if err != nil {
		return fmt.Errorf("invalid regex pattern: %w", err)
	}
	matches := re.FindStringSubmatch(html)
	if len(matches) < 2 {
		return fmt.Errorf("no match or no capture group found")
	}
	game.ID = matches[1]
	fmt.Println("Found a custom game on Steam:", game.Name, ", Id:", game.ID)
	return nil
}
