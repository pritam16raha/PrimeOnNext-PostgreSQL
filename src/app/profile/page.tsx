"use client"
import { useSession } from 'next-auth/react'
import React from 'react'

const ProfilePage = () => {

    const { data: user } = useSession()

  return (
    <div>
      <h1>Prifle Section</h1>
      <div className="gird">
        <div className="flex">
          <p>Name</p> <span>{user?.name}</span>
        </div>
        <div className='flex'>
          <p>Email</p> <span>{user?.email}</span>
        </div>
        <div className='flex'>
          <p>Is Admin</p> <span>{user?.id}</span>
        </div>
      </div>
    </div>
  );
}

export default ProfilePage