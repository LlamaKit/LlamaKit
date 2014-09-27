//
//  Box.swift
//  LlamaKit
//
//  Created by Maxwell Swadling on 27/09/2014.
//  Copyright (c) 2014 Maxwell Swadling. All rights reserved.
//

/// Due to current swift limitations, we have to include this Box in Result.
/// Swift cannot handle an enum with multiple associated data (A, NSError) where one is of unknown size (A)
final public class Box<T> {
  let unbox: T
  init(_ value: T) { self.unbox = value }
  
  public func map<U>(f: T -> U) -> Box<U> {
    return Box<U>(f(unbox))
  }
  
  public class func pure<T>(value: T) -> Box<T> {
    return Box<T>(value)
  }
  
  public func apply<U>(f: Box<T -> U>) -> Box<U> {
    return Box<U>(f.unbox(unbox))
  }
  
  public func flatMap<U>(f: T -> Box<U>) -> Box<U> {
    return f(unbox)
  }
}
