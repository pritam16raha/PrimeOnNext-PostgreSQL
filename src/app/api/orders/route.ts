// import { PrismaClient } from "@prisma/client";
import { getAuthSession } from "@/utils/auth";
import { prisma } from "@/utils/connect"; //importing global prisma instead of creating the instance every time
import { NextRequest, NextResponse } from "next/server";

// const prisma = new PrismaClient();

export const GET = async (req: NextRequest) => {
  //my request will be like -> localhost:3000/api/products?cat="body"

  const session = await getAuthSession();
  if (session) {
    try {
      if (session.user.isAdmin) {
        const orders = prisma.order.findMany();
        return new NextResponse(JSON.stringify(orders), { status: 200 });
      }
      const orders = prisma.order.findMany({
        where:{
            userEmail: session.user.email!
        }
      })
      return new NextResponse(JSON.stringify(orders), { status: 200 });
    } catch (err) {
      console.log(err);
      return new NextResponse(
        JSON.stringify({ message: "Error in fetching category" }),
        { status: 500 }
      );
    }
  } else {
    return new NextResponse(
      JSON.stringify({ message: "You are not Authenticated" }),
      { status: 401 }
    );
  }
};

export const POST = () => {
  return new NextResponse("Hello", { status: 200 });
};
