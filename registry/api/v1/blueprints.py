"""
Blueprints for the API's routes.
"""

from flask import Blueprint

__all__ = ["api_bp"]

api_bp = Blueprint("api", __name__)


@api_bp.route("/ping", methods=["GET", "POST", "PUT", "DELETE"])
def ping():
    """
    Confirms that the API is functioning at some minimal level.
    """
    return "pong!"


@api_bp.route("/verify_harbor_account")
def verify_harbor_account():
    """
    Verifies that the current user has created an account in Harbor.
    """
    return {"data": {"verified": False}}


@api_bp.route("/verify_orcid")
def verify_orcid():
    """
    Verifies that the current user has an ORCID.
    """
    return {"data": {"verified": False}}


@api_bp.route("/create_harbor_project")
def create_harbor_project():
    """
    Creates a "starter" project in Harbor for the current user.
    """
    return {"data": {"verified": False}}