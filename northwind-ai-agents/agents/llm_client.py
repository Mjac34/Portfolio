"""Shared LLM client for OpenAI-compatible providers.

Configure via .env:
    LLM_API_KEY   — required
    LLM_BASE_URL  — e.g. https://api.groq.com/openai/v1 (Groq),
                    https://generativelanguage.googleapis.com/v1beta/openai (Gemini)
    LLM_MODEL     — e.g. llama-3.3-70b-versatile, gemini-2.0-flash
"""
import os
from typing import Any, Dict, List, Optional

from dotenv import load_dotenv

load_dotenv()

DEFAULT_BASE_URL = "https://api.groq.com/openai/v1"
DEFAULT_MODEL = "openai/gpt-oss-120b"


def is_configured() -> bool:
    return bool(os.environ.get("LLM_API_KEY"))


def get_client():
    from openai import OpenAI

    return OpenAI(
        base_url=os.environ.get("LLM_BASE_URL", DEFAULT_BASE_URL),
        api_key=os.environ["LLM_API_KEY"],
    )


def chat(messages: List[Dict[str, Any]], model: Optional[str] = None,
         tools: Optional[List[Dict[str, Any]]] = None, temperature: float = 0.4):
    """Single chat completion call. Returns the raw response message."""
    client = get_client()
    kwargs: Dict[str, Any] = {
        "model": model or os.environ.get("LLM_MODEL", DEFAULT_MODEL),
        "messages": messages,
        "temperature": temperature,
    }
    if tools:
        kwargs["tools"] = tools
        kwargs["tool_choice"] = "auto"
    response = client.chat.completions.create(**kwargs)
    return response.choices[0].message
