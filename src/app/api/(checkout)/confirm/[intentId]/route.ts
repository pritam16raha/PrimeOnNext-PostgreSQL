import { prisma } from "@/utils/connect";
import { NextResponse } from "next/server";
import { NextRequest } from "next/server";

export const PUT = async (
  req: NextRequest,
  { params }: { params: { intentId: string } }
) => {
  const { intentId } = params;

  try {
    // Update the order in the database with the new status
    await prisma.order.update({
      where: {
        intent_id: intentId,
      },
      data: { status: "Being prepared!" },
    });

    // Return a success response
    return new NextResponse(
      JSON.stringify({ message: "Order has been updated" }),
      { status: 200 }
    );
  } catch (err) {
    console.log(err);

    // Return an error response if something goes wrong
    return new NextResponse(
      JSON.stringify({ message: "Something went wrong!" }),
      { status: 500 }
    );
  }
};
