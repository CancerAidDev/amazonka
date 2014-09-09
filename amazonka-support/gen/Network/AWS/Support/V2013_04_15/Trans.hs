{-# LANGUAGE FlexibleContexts  #-}
{-# LANGUAGE NoImplicitPrelude #-}

-- Module      : Network.AWS.Support.V2013_04_15.Trans
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | AWS Support is a one-on-one, fast-response support channel that is staffed
-- with experienced support personnel. The service helps customers get the
-- most from the products and features provided by Amazon Web Services. There
-- are four levels, or tiers, of AWS Support: Basic, Developer, Business, and
-- Enterprise. The Basic tier is free of charge and offers support for account
-- and billing questions and service limit increases. The other tiers offer an
-- unlimited number of technical support cases with pay-by-the-month pricing
-- and no long-term contracts, providing developers and businesses flexibility
-- to choose the level of support that meets their needs.
--
-- The 'State' operator variants from 'Control.Lens' such as '.=' can be
-- used to modify any additional request parameters before sending.
module Network.AWS.Support.V2013_04_15.Trans
    (
    -- * AddAttachmentsToSet
      addAttachmentsToSet
    -- * AddCommunicationToCase
    , addCommunicationToCase
    -- * CreateCase
    , createCase
    -- * DescribeAttachment
    , describeAttachment
    -- * DescribeCases
    , describeCases
    -- * DescribeCommunications
    , describeCommunications
    -- * DescribeServices
    , describeServices
    -- * DescribeSeverityLevels
    , describeSeverityLevels
    -- * DescribeTrustedAdvisorCheckRefreshStatuses
    , describeTrustedAdvisorCheckRefreshStatuses
    -- * DescribeTrustedAdvisorCheckResult
    , describeTrustedAdvisorCheckResult
    -- * DescribeTrustedAdvisorCheckSummaries
    , describeTrustedAdvisorCheckSummaries
    -- * DescribeTrustedAdvisorChecks
    , describeTrustedAdvisorChecks
    -- * RefreshTrustedAdvisorCheck
    , refreshTrustedAdvisorCheck
    -- * ResolveCase
    , resolveCase

    -- * Re-exported
    , module AWS
    , module Network.AWS.Support.V2013_04_15
    -- ** Lenses
    , (.=)
    , (?=)
    , (<>=)
    , (%=)
    ) where

import Control.Monad.Trans.AWS as AWS
import Network.AWS.Prelude
import Network.AWS.Support.V2013_04_15

-- | Adds one or more attachments to an attachment set. If an AttachmentSetId is
-- not specified, a new attachment set is created, and the ID of the set is
-- returned in the response. If an AttachmentSetId is specified, the
-- attachments are added to the specified set, if it exists. An attachment set
-- is a temporary container for attachments that are to be added to a case or
-- case communication. The set is available for one hour after it is created;
-- the ExpiryTime returned in the response indicates when the set expires. The
-- maximum number of attachments in a set is 3, and the maximum size of any
-- attachment in the set is 5 MB.
--
-- See: 'Network.AWS.Support.V2013_04_15.AddAttachmentsToSet'
addAttachmentsToSet :: ( MonadCatch m
                       , MonadResource m
                       , MonadError AWS.Error m
                       , MonadReader Env m
                       )
                    => [Attachment] -- ^ 'aatsAttachments'
                    -> State AddAttachmentsToSet a
                    -> m AddAttachmentsToSetResponse
addAttachmentsToSet p2 s =
    send $ (mkAddAttachmentsToSet p2) &~ s

-- | Adds additional customer communication to an AWS Support case. You use the
-- CaseId value to identify the case to add communication to. You can list a
-- set of email addresses to copy on the communication using the
-- CcEmailAddresses value. The CommunicationBody value contains the text of
-- the communication. The response indicates the success or failure of the
-- request. This operation implements a subset of the behavior on the AWS
-- Support Your Support Cases web form.
--
-- See: 'Network.AWS.Support.V2013_04_15.AddCommunicationToCase'
addCommunicationToCase :: ( MonadCatch m
                          , MonadResource m
                          , MonadError AWS.Error m
                          , MonadReader Env m
                          )
                       => Text -- ^ 'actcCommunicationBody'
                       -> State AddCommunicationToCase a
                       -> m AddCommunicationToCaseResponse
addCommunicationToCase p2 s =
    send $ (mkAddCommunicationToCase p2) &~ s

-- | Creates a new case in the AWS Support Center. This operation is modeled on
-- the behavior of the AWS Support Center Open a new case page. Its parameters
-- require you to specify the following information: IssueType. The type of
-- issue for the case. You can specify either "customer-service" or
-- "technical." If you do not indicate a value, the default is "technical."
-- ServiceCode. The code for an AWS service. You obtain the ServiceCode by
-- calling DescribeServices. CategoryCode. The category for the service
-- defined for the ServiceCode value. You also obtain the category code for a
-- service by calling DescribeServices. Each AWS service defines its own set
-- of category codes. SeverityCode. A value that indicates the urgency of the
-- case, which in turn determines the response time according to your service
-- level agreement with AWS Support. You obtain the SeverityCode by calling
-- DescribeSeverityLevels. Subject. The Subject field on the AWS Support
-- Center Open a new case page. CommunicationBody. The Description field on
-- the AWS Support Center Open a new case page. AttachmentSetId. The ID of a
-- set of attachments that has been created by using AddAttachmentsToSet.
-- Language. The human language in which AWS Support handles the case. English
-- and Japanese are currently supported. CcEmailAddresses. The AWS Support
-- Center CC field on the Open a new case page. You can list email addresses
-- to be copied on any correspondence about the case. The account that opens
-- the case is already identified by passing the AWS Credentials in the HTTP
-- POST method or in a method or function call from one of the programming
-- languages supported by an AWS SDK. To add additional communication or
-- attachments to an existing case, use AddCommunicationToCase. A successful
-- CreateCase request returns an AWS Support case number. Case numbers are
-- used by the DescribeCases operation to retrieve existing AWS Support cases.
--
-- See: 'Network.AWS.Support.V2013_04_15.CreateCase'
createCase :: ( MonadCatch m
              , MonadResource m
              , MonadError AWS.Error m
              , MonadReader Env m
              )
           => Text -- ^ 'ccSubject'
           -> Text -- ^ 'ccCommunicationBody'
           -> State CreateCase a
           -> m CreateCaseResponse
createCase p1 p5 s =
    send $ (mkCreateCase p1 p5) &~ s

-- | Returns the attachment that has the specified ID. Attachment IDs are
-- generated by the case management system when you add an attachment to a
-- case or case communication. Attachment IDs are returned in the
-- AttachmentDetails objects that are returned by the DescribeCommunications
-- operation.
--
-- See: 'Network.AWS.Support.V2013_04_15.DescribeAttachment'
describeAttachment :: ( MonadCatch m
                      , MonadResource m
                      , MonadError AWS.Error m
                      , MonadReader Env m
                      )
                   => Text -- ^ 'daAttachmentId'
                   -> State DescribeAttachment a
                   -> m DescribeAttachmentResponse
describeAttachment p1 s =
    send $ (mkDescribeAttachment p1) &~ s

-- | Returns a list of cases that you specify by passing one or more case IDs.
-- In addition, you can filter the cases by date by setting values for the
-- AfterTime and BeforeTime request parameters. Case data is available for 12
-- months after creation. If a case was created more than 12 months ago, a
-- request for data might cause an error. The response returns the following
-- in JSON format: One or more CaseDetails data types. One or more NextToken
-- values, which specify where to paginate the returned records represented by
-- the CaseDetails objects.
--
-- See: 'Network.AWS.Support.V2013_04_15.DescribeCases'
describeCases :: ( MonadCatch m
                 , MonadResource m
                 , MonadError AWS.Error m
                 , MonadReader Env (ResumableSource m)
                 )
              => State DescribeCases a
              -> ResumableSource m DescribeCasesResponse
describeCases s =
    paginate (mkDescribeCases &~ s)

-- | Returns communications (and attachments) for one or more support cases. You
-- can use the AfterTime and BeforeTime parameters to filter by date. You can
-- use the CaseId parameter to restrict the results to a particular case. Case
-- data is available for 12 months after creation. If a case was created more
-- than 12 months ago, a request for data might cause an error. You can use
-- the MaxResults and NextToken parameters to control the pagination of the
-- result set. Set MaxResults to the number of cases you want displayed on
-- each page, and use NextToken to specify the resumption of pagination.
--
-- See: 'Network.AWS.Support.V2013_04_15.DescribeCommunications'
describeCommunications :: ( MonadCatch m
                          , MonadResource m
                          , MonadError AWS.Error m
                          , MonadReader Env (ResumableSource m)
                          )
                       => Text -- ^ 'dc1CaseId'
                       -> State DescribeCommunications a
                       -> ResumableSource m DescribeCommunicationsResponse
describeCommunications p1 s =
    paginate $ (mkDescribeCommunications p1) &~ s

-- | Returns the current list of AWS services and a list of service categories
-- that applies to each one. You then use service names and categories in your
-- CreateCase requests. Each AWS service has its own set of categories. The
-- service codes and category codes correspond to the values that are
-- displayed in the Service and Category drop-down lists on the AWS Support
-- Center Open a new case page. The values in those fields, however, do not
-- necessarily match the service codes and categories returned by the
-- DescribeServices request. Always use the service codes and categories
-- obtained programmatically. This practice ensures that you always have the
-- most recent set of service and category codes.
--
-- See: 'Network.AWS.Support.V2013_04_15.DescribeServices'
describeServices :: ( MonadCatch m
                    , MonadResource m
                    , MonadError AWS.Error m
                    , MonadReader Env m
                    )
                 => State DescribeServices a
                 -> m DescribeServicesResponse
describeServices s =
    send (mkDescribeServices &~ s)

-- | Returns the list of severity levels that you can assign to an AWS Support
-- case. The severity level for a case is also a field in the CaseDetails data
-- type included in any CreateCase request.
--
-- See: 'Network.AWS.Support.V2013_04_15.DescribeSeverityLevels'
describeSeverityLevels :: ( MonadCatch m
                          , MonadResource m
                          , MonadError AWS.Error m
                          , MonadReader Env m
                          )
                       => State DescribeSeverityLevels a
                       -> m DescribeSeverityLevelsResponse
describeSeverityLevels s =
    send (mkDescribeSeverityLevels &~ s)

-- | Returns the refresh status of the Trusted Advisor checks that have the
-- specified check IDs. Check IDs can be obtained by calling
-- DescribeTrustedAdvisorChecks.
--
-- See: 'Network.AWS.Support.V2013_04_15.DescribeTrustedAdvisorCheckRefreshStatuses'
describeTrustedAdvisorCheckRefreshStatuses :: ( MonadCatch m
                                              , MonadResource m
                                              , MonadError AWS.Error m
                                              , MonadReader Env m
                                              )
                                           => [Text] -- ^ 'dtacrsCheckIds'
                                           -> State DescribeTrustedAdvisorCheckRefreshStatuses a
                                           -> m DescribeTrustedAdvisorCheckRefreshStatusesResponse
describeTrustedAdvisorCheckRefreshStatuses p1 s =
    send $ (mkDescribeTrustedAdvisorCheckRefreshStatuses p1) &~ s

-- | Returns the results of the Trusted Advisor check that has the specified
-- check ID. Check IDs can be obtained by calling
-- DescribeTrustedAdvisorChecks. The response contains a
-- TrustedAdvisorCheckResult object, which contains these three objects:
-- TrustedAdvisorCategorySpecificSummary TrustedAdvisorResourceDetail
-- TrustedAdvisorResourcesSummary In addition, the response contains these
-- fields: Status. The alert status of the check: "ok" (green), "warning"
-- (yellow), "error" (red), or "not_available". Timestamp. The time of the
-- last refresh of the check. CheckId. The unique identifier for the check.
--
-- See: 'Network.AWS.Support.V2013_04_15.DescribeTrustedAdvisorCheckResult'
describeTrustedAdvisorCheckResult :: ( MonadCatch m
                                     , MonadResource m
                                     , MonadError AWS.Error m
                                     , MonadReader Env m
                                     )
                                  => Text -- ^ 'dtacrCheckId'
                                  -> State DescribeTrustedAdvisorCheckResult a
                                  -> m DescribeTrustedAdvisorCheckResultResponse
describeTrustedAdvisorCheckResult p1 s =
    send $ (mkDescribeTrustedAdvisorCheckResult p1) &~ s

-- | Returns the summaries of the results of the Trusted Advisor checks that
-- have the specified check IDs. Check IDs can be obtained by calling
-- DescribeTrustedAdvisorChecks. The response contains an array of
-- TrustedAdvisorCheckSummary objects.
--
-- See: 'Network.AWS.Support.V2013_04_15.DescribeTrustedAdvisorCheckSummaries'
describeTrustedAdvisorCheckSummaries :: ( MonadCatch m
                                        , MonadResource m
                                        , MonadError AWS.Error m
                                        , MonadReader Env m
                                        )
                                     => [Text] -- ^ 'dtacsCheckIds'
                                     -> State DescribeTrustedAdvisorCheckSummaries a
                                     -> m DescribeTrustedAdvisorCheckSummariesResponse
describeTrustedAdvisorCheckSummaries p1 s =
    send $ (mkDescribeTrustedAdvisorCheckSummaries p1) &~ s

-- | Returns information about all available Trusted Advisor checks, including
-- name, ID, category, description, and metadata. You must specify a language
-- code; English ("en") and Japanese ("ja") are currently supported. The
-- response contains a TrustedAdvisorCheckDescription for each check.
--
-- See: 'Network.AWS.Support.V2013_04_15.DescribeTrustedAdvisorChecks'
describeTrustedAdvisorChecks :: ( MonadCatch m
                                , MonadResource m
                                , MonadError AWS.Error m
                                , MonadReader Env m
                                )
                             => Text -- ^ 'dtacLanguage'
                             -> State DescribeTrustedAdvisorChecks a
                             -> m DescribeTrustedAdvisorChecksResponse
describeTrustedAdvisorChecks p1 s =
    send $ (mkDescribeTrustedAdvisorChecks p1) &~ s

-- | Requests a refresh of the Trusted Advisor check that has the specified
-- check ID. Check IDs can be obtained by calling
-- DescribeTrustedAdvisorChecks. The response contains a
-- RefreshTrustedAdvisorCheckResult object, which contains these fields:
-- Status. The refresh status of the check: "none", "enqueued", "processing",
-- "success", or "abandoned". MillisUntilNextRefreshable. The amount of time,
-- in milliseconds, until the check is eligible for refresh. CheckId. The
-- unique identifier for the check.
--
-- See: 'Network.AWS.Support.V2013_04_15.RefreshTrustedAdvisorCheck'
refreshTrustedAdvisorCheck :: ( MonadCatch m
                              , MonadResource m
                              , MonadError AWS.Error m
                              , MonadReader Env m
                              )
                           => Text -- ^ 'rtacCheckId'
                           -> State RefreshTrustedAdvisorCheck a
                           -> m RefreshTrustedAdvisorCheckResponse
refreshTrustedAdvisorCheck p1 s =
    send $ (mkRefreshTrustedAdvisorCheck p1) &~ s

-- | Takes a CaseId and returns the initial state of the case along with the
-- state of the case after the call to ResolveCase completed.
--
-- See: 'Network.AWS.Support.V2013_04_15.ResolveCase'
resolveCase :: ( MonadCatch m
               , MonadResource m
               , MonadError AWS.Error m
               , MonadReader Env m
               )
            => State ResolveCase a
            -> m ResolveCaseResponse
resolveCase s =
    send (mkResolveCase &~ s)
