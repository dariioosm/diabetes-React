import React, { createContext } from "react";

export const ValidationContext = createContext({
  usernameRegex: /^[a-z][a-z0-9]{5,}$/, // min 6, empieza por letra
  passwordRegex: /^(?=.*[A-Z])(?=.*\d).{8,}$/, // min 8, 1 mayúscula, 1 número
});
