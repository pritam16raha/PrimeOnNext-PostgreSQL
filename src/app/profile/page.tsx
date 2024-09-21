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
          <p>Name</p> <span>Pritam</span>
        </div>
        <div className='flex'>
          <p>Email</p> <span>rahapritam</span>
        </div>
        <div className='flex'>
          <p>Is Admin</p> <span>nah admin nah</span>
        </div>
      </div>
    </div>
  );
}

export default ProfilePage