import { ActionTypes, CartType } from "@/types/types";
import { create } from "zustand";
import { persist } from "zustand/middleware";

// const useBearStore = create((set) => ({
//   bears: 0, //my states
//   increasePopulation: () => set((state) => ({ bears: state.bears + 1 })), //my functions
//   removeAllBears: () => set({ bears: 0 }),
// }));

const INITIAL_STATE = {
  products: [],
  totalItems: 0,
  totalPrice: 0,
};

export const useCartStore = create(persist<CartType & ActionTypes>((set, get) => ({
  //initial state
  products: INITIAL_STATE.products,
  totalItems: INITIAL_STATE.totalItems,
  totalPrice: INITIAL_STATE.totalPrice,
  //state management functions 1
  addToCart(item) {
    set((state) => ({
      products: [...state.products, item],
      totalItems: state.totalItems + item.quantity,
      totalPrice: state.totalPrice + item.price,
    }));
  },
  //state management functions 2
  removeFromCart(item) {
    set((state) => ({
      products: state.products.filter((product) => product.id !== item.id),
      totalItems: state.totalItems - item.quantity,
      totalPrice: state.totalPrice - item.price,
    }));
  },
}), {name: "cart" , skipHydration: true}));
//basically we are saving the cart into local storage. name is "cart"
