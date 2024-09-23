"use client"
import { useSession } from 'next-auth/react'
import React from 'react'

const ProfilePage = () => {

    const { data: user } = useSession()

    console.log("user is", user)

  return (
    <div className='m-auto max-w-4xl bg-blue-200'>
      <h1>Prifle Section</h1>
      <div className="grid">
        <div className="flex">
          <p>Name</p> <span>{user?.user.name}</span>
        </div>
        <div className='flex'>
          <p>Email</p> <span>{user?.user.email}</span>
        </div>
        <div className='flex'>
          <p>Phone :</p> <span>Null</span>
        </div>
      </div>
    </div>
  );
}

export default ProfilePage