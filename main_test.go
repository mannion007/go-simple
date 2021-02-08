package main

import (
	"testing"
)

func TestHappyHealthCheck(t *testing.T) {
	if 1 != 1 {
		t.Error("that just failed")
	}
}
