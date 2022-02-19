
// NOTE: when fetcing you need the method to be UPPERCASE (eg PATCH) for some reason

import Rails from "@rails/ujs";
Rails.csrfToken(); // need to set X-CSRF-Token header so rails can validate request