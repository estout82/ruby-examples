#!/usr/bin/env ruby

# basically a PORO with some validation logic
# - remove business logic from controllers and views

class SurveyInviter
    include ActiveModel::Model # access active record model seperatley from database records

    attr_accessor :recipients, :message, :sender, :survey_id
    
    validates :message, presence: true
    validates :recipients, length: { minimum: 1 }
    validates :sender, presence: true
    validates :survey, presence: true

    validates_with EnumerableValidator,
        attributes: [:recipients],
        unless: "recipients.nil?",
        validator: EmailValidator

    def recipients=(recipients)
        @recipients = recipients
    end

    def invite
        if valid?
            deliver_invitations
        end
    end

    private

    def create_invitations
        recipients.map do |recipient_email|
            Invitation.create!(
                survey: survey,
                sender: sender,
                recipient_email: recipient_email,
                status: 'pending'
            )
        end
    end

    def deliver_invitations
        create_invitations.each do |invitation|
            Mailer.invitation_notification(invitation, message).deliver
        end
    end
end

class InvitationsController < ApplicationController
    def new
        @survey = Survey.find(params[:survey_id])
        @survey_inviter = SurveyInviter.new
    end

    def create
        @survey = Survey.find(params[:survey_id])
        @survey_inviter = SurveyInviter.new(survey_inviter_params)

        if @survey_inviter.invite
            redirect_to survey_path(@survey), notice: 'Invitation successfully sent'
        else
            render 'new'
        end
    end

    private

    def survey_inviter_params
        params.require(:survey_inviter).permit(
            :message,
            :recipients
        ).merge(
            sender: current_user,
            survey: @survey
        )
    end
end