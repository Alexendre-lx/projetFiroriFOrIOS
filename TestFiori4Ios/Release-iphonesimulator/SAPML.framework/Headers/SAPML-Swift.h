// Generated by Apple Swift version 5.1.2 (swiftlang-1100.0.278 clang-1100.0.33.9)
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wgcc-compat"

#if !defined(__has_include)
# define __has_include(x) 0
#endif
#if !defined(__has_attribute)
# define __has_attribute(x) 0
#endif
#if !defined(__has_feature)
# define __has_feature(x) 0
#endif
#if !defined(__has_warning)
# define __has_warning(x) 0
#endif

#if __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <Foundation/Foundation.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus)
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...)
# endif
#endif

#if __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
#endif
#if __has_attribute(noescape)
# define SWIFT_NOESCAPE __attribute__((noescape))
#else
# define SWIFT_NOESCAPE
#endif
#if __has_attribute(warn_unused_result)
# define SWIFT_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
#else
# define SWIFT_WARN_UNUSED_RESULT
#endif
#if __has_attribute(noreturn)
# define SWIFT_NORETURN __attribute__((noreturn))
#else
# define SWIFT_NORETURN
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif
#if !defined(SWIFT_RESILIENT_CLASS)
# if __has_attribute(objc_class_stub)
#  define SWIFT_RESILIENT_CLASS(SWIFT_NAME) SWIFT_CLASS(SWIFT_NAME) __attribute__((objc_class_stub))
#  define SWIFT_RESILIENT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_class_stub)) SWIFT_CLASS_NAMED(SWIFT_NAME)
# else
#  define SWIFT_RESILIENT_CLASS(SWIFT_NAME) SWIFT_CLASS(SWIFT_NAME)
#  define SWIFT_RESILIENT_CLASS_NAMED(SWIFT_NAME) SWIFT_CLASS_NAMED(SWIFT_NAME)
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM_ATTR)
# if defined(__has_attribute) && __has_attribute(enum_extensibility)
#  define SWIFT_ENUM_ATTR(_extensibility) __attribute__((enum_extensibility(_extensibility)))
# else
#  define SWIFT_ENUM_ATTR(_extensibility)
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name, _extensibility) enum _name : _type _name; enum SWIFT_ENUM_ATTR(_extensibility) SWIFT_ENUM_EXTRA _name : _type
# if __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME, _extensibility) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_ATTR(_extensibility) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME, _extensibility) SWIFT_ENUM(_type, _name, _extensibility)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if !defined(SWIFT_UNAVAILABLE_MSG)
# define SWIFT_UNAVAILABLE_MSG(msg) __attribute__((unavailable(msg)))
#endif
#if !defined(SWIFT_AVAILABILITY)
# define SWIFT_AVAILABILITY(plat, ...) __attribute__((availability(plat, __VA_ARGS__)))
#endif
#if !defined(SWIFT_WEAK_IMPORT)
# define SWIFT_WEAK_IMPORT __attribute__((weak_import))
#endif
#if !defined(SWIFT_DEPRECATED)
# define SWIFT_DEPRECATED __attribute__((deprecated))
#endif
#if !defined(SWIFT_DEPRECATED_MSG)
# define SWIFT_DEPRECATED_MSG(...) __attribute__((deprecated(__VA_ARGS__)))
#endif
#if __has_feature(attribute_diagnose_if_objc)
# define SWIFT_DEPRECATED_OBJC(Msg) __attribute__((diagnose_if(1, Msg, "warning")))
#else
# define SWIFT_DEPRECATED_OBJC(Msg) SWIFT_DEPRECATED_MSG(Msg)
#endif
#if !defined(IBSegueAction)
# define IBSegueAction
#endif
#if __has_feature(modules)
#if __has_warning("-Watimport-in-framework-header")
#pragma clang diagnostic ignored "-Watimport-in-framework-header"
#endif
@import CoreGraphics;
@import CoreML;
@import Foundation;
@import UIKit;
@import Vision;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
#if __has_warning("-Wpragma-clang-attribute")
# pragma clang diagnostic ignored "-Wpragma-clang-attribute"
#endif
#pragma clang diagnostic ignored "-Wunknown-pragmas"
#pragma clang diagnostic ignored "-Wnullability"

#if __has_attribute(external_source_symbol)
# pragma push_macro("any")
# undef any
# pragma clang attribute push(__attribute__((external_source_symbol(language="Swift", defined_in="SAPML",generated_declaration))), apply_to=any(function,enum,objc_interface,objc_category,objc_protocol))
# pragma pop_macro("any")
#endif

@class NSCoder;

/// The <code>FUITextRecognitionView</code> can be used to perform text recognition using device camera. Video captured from device camera would be shown in entire bounds. Use <code>captureMaskPath</code> to define the sub-frame of the view, in which the text would be recognized. If <code>captureMaskPath</code> is set to nil, the text in full screen will be reconized. Rest of the frame would be dimmed by <code>overlayView</code>. This default behavior can be changed by setting view and layer properties of <code>overlayView</code>. All the observations, that is, recognized text blocks and corresponding bounding boxes, would be returned back to <code>observationHandler</code>. To provide hint to user to what texts are recognized, use <code>showTexts</code> to show the observations on top of captured video.
/// Call <code>startSession</code> to start capturing the video. This is normally called when view appears. Since text recognition model are memory and cpu intensive, it won’t be run until user has stabilized the device camera. After that <code>observationHandler</code> would be called for every video frame with observations. <code>observationHandler</code> can be used to perform any validations and filtering on the observations. Validate if it is a credit card number if observations have 16 numeric digits in total and discard any other observations, for example. Once the filtered observations meet the desired criteria, call <code>stopSession</code> to stop capturing the video. Make sure to call <code>stopSession</code> in case view disappears.
/// When initializing <code>FUITextRecognitionView</code>, you can specify the style you want. Default style is <code>singleField</code> style. <code>singleField</code> provides a default-sized capturing box for capturing infomation of a single field (E.g. phone number or email address). The other one is <code>multi-field</code> style which provides a large-sized capturing box for capturing information of mutiple fields (E.g. business card).
/// <h2>Example Initialization and Configuration</h2>
/// \code
///
/// let recognitionView = FUITextRecognitionView()
///
/// recognitionView.observationHandler = { observations
///
///    let filteredObservations = <#filter out unwanted text#>
///
///    //show text over captured video to provide feedback to user to what is scanned
///    recognitionView.showTexts(for: filteredObservations)
///
///    let areObservationsValid = <#filteredObservations meets desired criteria#>
///
///    if areObservationsValid {
///        DispatchQueue.main.async {
///            //place captured text in text field
///            textField.text = filteredObservations.map { $0.value }.joined(separator:" ")
///        }
///        //on return true, session would be automatically stoped and observationHandler would no longer be called
///        return true
///    }
///    return false
/// }
///
/// //start session to capture frames from back camera
/// recognitionView.startSession()
///
///
/// \endcode<ul>
///   <li>
///   </li>
/// </ul>
SWIFT_CLASS("_TtC5SAPML22FUITextRecognitionView")
@interface FUITextRecognitionView : UIView
/// :nodoc:
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
/// :nodoc:
- (nonnull instancetype)init;
/// :nodoc:
- (void)layoutSubviews;
- (nonnull instancetype)initWithFrame:(CGRect)frame SWIFT_UNAVAILABLE;
@end



@class NSBundle;

/// The <code>FUITextRecognitionViewController</code> is convenience controller embedding <code>FUITextRecognitionView</code> view which captures video from device back camera and performs text recognition. For more example to how to configure text recognition check out the <code>FUITextRecognitionView</code> documentation.
/// <h2>Example Initialization and Configuration</h2>
/// \code
/// textRecController = FUITextRecognitionViewController()
/// //additional phone number detector to filter out observations
/// let detector = try! NSDataDetector.init(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
///
/// var frameCount = 10 //capture the observations after 10 frames
/// textRecController.recognitionView.observationHandler = { observations in
///    //use NSDataDetector extensions to run matches on observations
///    let matches = detector.matches(in: observations)
///    textRecController.recognitionView.showTexts(for: observations, with: matches)
///    frameCount -= 1
///    if frameCount < 0 {
///        DispatchQueue.main.async {
///            var phoneNumber: String?
///            for match in matches where match.resultType == .phoneNumber {
///                    phoneNumber = match.phoneNumber
///            }
///            textView.text = phoneNumber ?? ""
///            dismiss(animated: true)
///        }
///        return true
///    }
///    return false
/// }
///
/// textRecController.onClose = {
///    dismiss(animated: true)
/// }
///
/// present(UINavigationController(rootViewController: textRecController), animated: true)
///
/// \endcode
SWIFT_CLASS("_TtC5SAPML32FUITextRecognitionViewController")
@interface FUITextRecognitionViewController : UIViewController
/// :nodoc:
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
/// :nodoc:
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)animated;
/// :nodoc:
- (void)viewDidAppear:(BOOL)animated;
- (void)viewWillDisappear:(BOOL)animated;
/// :nodoc:
- (void)viewDidDisappear:(BOOL)animated;
/// :nodoc:
@property (nonatomic, readonly) BOOL prefersStatusBarHidden;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil SWIFT_UNAVAILABLE;
@end






/// Information about regions of text detected and corresponding string value.
SWIFT_CLASS("_TtC5SAPML20SAPMLTextObservation")
@interface SAPMLTextObservation : VNRectangleObservation
/// :nodoc:
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder SWIFT_UNAVAILABLE;
/// :nodoc:
@property (nonatomic, readonly, copy) NSUUID * _Nonnull uuid;
/// :nodoc:
@property (nonatomic, readonly) CGRect boundingBox;
/// :nodoc:
@property (nonatomic, readonly) CGPoint topLeft;
/// :nodoc:
@property (nonatomic, readonly) CGPoint topRight;
/// :nodoc:
@property (nonatomic, readonly) CGPoint bottomRight;
/// :nodoc:
@property (nonatomic, readonly) CGPoint bottomLeft;
/// :nodoc:
@property (nonatomic, readonly, copy) NSString * _Nonnull description;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


SWIFT_CLASS("_TtC5SAPML25SAPMLTextBlockObservation")
@interface SAPMLTextBlockObservation : SAPMLTextObservation
@end


SWIFT_CLASS("_TtC5SAPML26SAPMLTextColumnObservation")
@interface SAPMLTextColumnObservation : SAPMLTextObservation
@end



SWIFT_CLASS("_TtC5SAPML23SAPMLTextRowObservation")
@interface SAPMLTextRowObservation : SAPMLTextObservation
@end



#if __has_attribute(external_source_symbol)
# pragma clang attribute pop
#endif
#pragma clang diagnostic pop
