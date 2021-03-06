/**
 * Copyright IBM Corporation 2018
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 **/

import Foundation

/**
 A set of values representing the format of a response body.

 This struct is intended to be "enum-like" and values should be
 accessed via the public static stored properties.

 - Note: An enum was not used here because currently enums are
         always exhaustive. This means adding a case to an enum
         is a breaking change. In order to keep such additions
         non-breaking we have used an "enum-like" struct instead.
         This means code using `BodyFormat` should always handle
         unrecognised `BodyFormat` values (eg in a default case
         of a switch). `UnsupportedBodyFormatError` may be used
         in this situation.

 ### Usage Example: ###
 ````
 let format = BodyFormat.json
 ````
 */
public struct BodyFormat: Equatable {
    public let type: String

    private init(_ type: String) {
        self.type = type
    }

    public static func == (_ lhs: BodyFormat, _ rhs: BodyFormat) -> Bool {
        return lhs.type == rhs.type
    }

    public static let json = BodyFormat("application/json")
}

/**
 An error that may be thrown when a particular instance of `BodyFormat`
 is not supported
 */
public struct UnsupportedBodyFormatError: Error {
    public let bodyFormat: BodyFormat
    public init(_ bodyFormat: BodyFormat) {
        self.bodyFormat = bodyFormat
    }
}
