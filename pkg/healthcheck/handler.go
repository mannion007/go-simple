package healthcheck

import (
	"encoding/json"
	"net/http"
)

//Handler handles health check requests
type Handler struct {
}

// Result is the outcome of a healtcheck, comprised of a status and a set of 0 or more messages
type Result struct {
	Status   string   `json:"status"`
	Messages []string `json:"messages"`
}

func (h Handler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	res := Result{
		Status:   "ok",
		Messages: []string{},
	}

	body, _ := json.Marshal(res)

	w.Write(body)
}
