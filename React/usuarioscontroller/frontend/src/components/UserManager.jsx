import React, { useState } from 'react';
import { ValidationContext } from './ValidationContext';
import UserForm from './UserForm';
import UserList from './UserList';

const UserManager = () => {
  const [refresh, setRefresh] = useState(false);

  const forceRefresh = () => setRefresh(!refresh);

  return (
    <ValidationContext.Provider value={{
      usernameRegex: /^[a-z][a-z0-9]{5,}$/,
      passwordRegex: /^(?=.*[A-Z])(?=.*\d).{8,}$/
    }}>
      <UserForm onUserAdded={forceRefresh} />
      <hr />
      <UserList refresh={refresh} />
    </ValidationContext.Provider>
  );
};

export default UserManager;
