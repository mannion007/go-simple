package main

import (
	"io/ioutil"
	"net/http"
	"testing"

	"github.com/stretchr/testify/suite"
)

type EndToEndSuite struct {
	suite.Suite
}

func TestEndToEndSuite(t *testing.T) {
	suite.Run(t, new(EndToEndSuite))
}

func (s *EndToEndSuite) TestHappyHealthCheck() {

	client := &http.Client{}

	resp, err := client.Get("http://localhost:8080/healthcheck")

	s.NoError(err)

	defer resp.Body.Close()

	s.Equal(http.StatusOK, resp.StatusCode)

	b, _ := ioutil.ReadAll(resp.Body)

	s.JSONEq(`{"status":"ok", "messages":[]}`, string(b))
}
